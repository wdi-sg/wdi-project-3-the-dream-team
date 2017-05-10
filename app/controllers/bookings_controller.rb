class BookingsController < ApplicationController
  before_action :form_booking, only: %i[create]
  def index
  end

  def new
    @event = Event.find(params[:event_id])
    @session = Session.find(params[:session])
    @new_booking = Booking.new
    # p params[:session]
  end

  def create
    @session = Session.find(params[:session][:id])
    @new_booking = Booking.new(@form_data)
    @new_booking.amount = @session.price * @new_booking.pax
    @new_booking.craftee = current_craftee
    @new_booking.session = @session
    @new_booking.status = 'confirmed'
    if @new_booking.pax + @session.pax < @session.capacity

      # stripe processing
      #
      # Make a one-off payment to the user.
      # See app/assets/javascripts/app/pay.coffee
      #
      # Find the user to pay.
      crafter = @session.event.crafter
      user = User.find(crafter.user_id)

      # Charge $10. => 1000 (stripe amount in cents)
      amount = @new_booking.amount * 100
      # Calculate the fee amount that goes to the application.
      fee = (amount * Rails.application.secrets.fee_percentage).to_i

      begin
        charge_attrs = {
          amount: amount,
          currency: crafter.currency,
          source: params[:token],
          description: "Test Charge via Stripe Connect",
          application_fee: fee
        }

        # Use the user-to-be-paid's access token
        # to make the charge directly on their account
        charge = Stripe::Charge.create(charge_attrs, crafter.secret_key)

        # flash[:notice] = "Charged successfully! <a target='_blank' rel='#{params[:charge_on]}-account' href='https://dashboard.stripe.com/test/payments/#{charge.id}'>View in dashboard &raquo;</a>"

        # if charge is successful, save charge id
        @new_booking.invoice_id = charge.id

        if @session.bookings << @new_booking
          p @new_booking.pax
          @session.pax += @new_booking.pax
          @session.save
          flash[:notice] = "Payment successfully processed. Your booking is confirmed."
          # redirect to confirmation page
          redirect_to event_booking_path(@new_booking.session.event.id, @new_booking.id)
        else
          flash[:alert] = 'Booking was unsuccessful'
          redirect_to event_path(params[:event_id])
        end
      rescue Stripe::CardError => e
        error = e.json_body[:error][:message]
        flash[:error] = "Charge failed! #{error}"
        redirect_to event_path(params[:event_id])
      end
    else
      flash[:alert] = 'Booking unsuccessful. This event has been fully booked.'
      redirect_to event_path(params[:event_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def form_booking
    @form_data = params.require(:booking).permit(:pax)
  end
end
