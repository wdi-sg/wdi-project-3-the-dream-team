class BookingsController < ApplicationController
  before_action :form_booking, only: %i[create]
  def index
  end

  def new
    @event = Event.find(params[:event_id])
    @session = Session.find(params[:session])
    @new_booking = Booking.new
    p params[:session]
  end

  def create
    @session = Session.find(params[:session][:id])
    @new_booking = Booking.new(@form_data)
    @new_booking.amount = @session.price * @new_booking.pax
    @new_booking.craftee = current_craftee

    if @session.bookings << @new_booking
      p @new_booking.pax
      @session.pax += @new_booking.pax
      @session.save
      flash[:notice] = 'Booking was successful'
    else
      flash[:notice] = 'Booking was unsuccessful'
    end
    redirect_to event_path(params[:event_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def form_booking
    @form_data = params.require(:booking).permit(:pax)
  end
end
