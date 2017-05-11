class SessionsController < ApplicationController

  before_action :form_session, except: %i[destroy]
  before_action :find_session, except: %i[create]

  def create
    # p @form_data
    @event = Event.find(params[:event_id])

    @new_session = Session.new(@form_data)
    @new_session.pax = 0

    if Time.at(@new_session.datetime_from).to_date === Time.at(@new_session.datetime_to).to_date
      if @new_session.datetime_from < @new_session.datetime_to
        if @event.sessions << @new_session
          flash[:notice] = 'Session created successfully!'
        else
          flash[:alert] = 'Failed to create session'
        end
      else
          flash[:alert] = 'From Datetime must be earlier than To Datetime.'
      end
    else
      flash[:alert] = 'Sorry. System only support sessions within the same day.'
    end
    redirect_to event_path(@event)
  end

  def update
    sess = Session.new(@form_data)
    if Time.at(sess.datetime_from).to_date === Time.at(sess.datetime_to).to_date
      if sess.datetime_from < sess.datetime_to
        if @session.update(@form_data)
          flash[:notice] = 'Session updated successfully!'
        else
          flash[:alert] = 'Failed to update session'
        end
      else
        flash[:alert] = 'From Datetime must be earlier than To Datetime.'
      end
    else
      flash[:alert] = 'Sorry. System only support sessions within the same day.'
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
