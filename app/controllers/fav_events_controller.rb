class FavEventsController < ApplicationController
  before_action :form_fav_event, only: %i[create]

  def index
    @all_events = Event.joins(:fav_events).where('fav_events.craftee_id' => params[:craftee_id])
    p 'ALL FAV EVENTS HERE'
    p @all_events
  end

  def create
    @craftee = Craftee.find(params[:craftee_id])

    p @craftee

    @event = Event.find(params[:event_id])

    p @event

    @fav = FavEvent.find_by(craftee_id: @craftee.id, event_id: @event.id)

    if @fav
      # @fav = FavEvents.find_by(event_id: @event.id)
      if @fav.destroy
        # send destroy success response
        @response = 'Unfavourited!'
        @is_favourite = false
      else
        # send destroy failed response
        @response = 'Fail to unfavourite!'
      end
    else
      if @craftee.fav_events << FavEvent.new(@form_data)
        # send create success response
        @response = 'Favourited!'
        @is_favourite = true
      else
        # send create failed response
        @response = 'Fail to favourite!'
      end
    end

    respond_to do |format|
      # format.json { render json: @response, success: true }
      format.json { render json:
                      { success: true,
                        data: @response,
                        favourite: @is_favourite
                       }
                   }
    end
  end

  private

  def form_fav_event
    @form_data = params.permit(:craftee_id, :event_id)
  end
end
