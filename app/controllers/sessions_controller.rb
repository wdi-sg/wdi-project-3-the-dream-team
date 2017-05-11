class SessionsController < ApplicationController

  before_action :form_session, except: %i[destroy]
  before_action :find_session, except: %i[create]

  def create
    # p @form_data
    @event = Event.find(params[:event_id])

    @new_session = Session.new(@form_data)
    @new_session.pax = 0

    if @new_session.datetime_from.day == @new_session.datetime_to.day
      if @event.sessions << @new_session
        flash[:notice] = 'Session created successfully!'
      else
        flash[:alert] = 'Failed to create session'
      end
    else
      flash[:alert] = 'Sorry. System only support sessions within the same day.'
    end
    redirect_to event_path(@event)
  end

  def update
    if @session.update(@form_data)
      flash[:notice] = 'Session updated successfully!'
    else
      flash[:alert] = 'Failed to update session'
    end
    redirect_to event_path(@session.event)
  end

  def destroy
    @event = Event.find(params[:event_id])

    if @session.destroy
      flash[:notice] = 'Session deleted successfully!'
    else
      flash[:alert] = 'Failed to delete session'
    end
    redirect_to event_path(@event)
  end



  private

  def form_session
    @form_data = params
    .require(:session)
    .permit(:datetime_from, :datetime_to, :price, :capacity, :pax)
  end

  def find_session
    @session = Session.find(params[:id])
  end

end
