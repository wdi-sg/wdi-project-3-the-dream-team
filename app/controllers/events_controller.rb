class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show filter]

  before_action :find_event, except: %i[index new create filter]
  before_action :form_event, only: %i[create update]

  def index
    @all_events = Event.all.paginate(:page => params[:page], :per_page => 15)
    @categories = Category.all
    # @eventsPaginate = Event.all.paginate(:page => params[:page], :per_page => 10)

  end

  def show
  end

  def new
    unless @new_event
      @new_event = Event.new
    end
  end

  def create
    @crafter = current_crafter

    @new_event = Event.new(@form_data)

    if @crafter.events << @new_event
      flash[:notice] = 'Event created successfully!'
      redirect_to event_path(@new_event)
    else
      flash[:alert] = "Failed to create event! #{@form_data.inspect} form data"
      render 'events/new'
    end
  end

  def edit
  end

  def update
    p "update params here #{@form_data.inspect}"
    if @event.update(@form_data)
      flash[:notice] = 'Event updated! successfully!'
      redirect_to event_path
    else
      flash[:alert] = 'Failed to update event!'
      render 'events/show'
    end
  end

  def destroy
  end

  def filter
    p params[:category_id]
    if params[:category_id] == ''
      @filtered = Event.all
    else
      @filtered = Event.where(category_id: params[:category_id])
    end

    respond_to do |format|
      format.js
      # format.json { render json: {  success: true,
      #                               data: @filtered }}
    end
  end

  def my_events
    #code
    @crafter = Crafter.find(params[:id])
    @crafterEvents = @crafter.events
    @all_events = @crafterEvents.paginate(:page => params[:page], :per_page => 15)
    render 'events/index'
  end


  helper_method :check_time
  def search
    p 'search request received'
    p params
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def form_event
    @form_data =  params
                  .require(:event)
                  .permit(:name, :description, :category_id)
  end
end
