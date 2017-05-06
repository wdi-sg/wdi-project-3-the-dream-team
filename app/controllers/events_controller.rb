class EventsController < ApplicationController
  # before_action :is_craftee_authenticated, only: [:new, :create, :edit, :update, :destroy]

  before_action :find_event, except: %i[index new create]
  before_action :form_event, only: %i[create update]

  def index
    @all_events = Event.all
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
    p 'update request received!'
    redirect_to event_path
  end

  def destroy

  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def form_event
    @form_data = params.require(:event).permit(:name, :description, :category_id)
  end

end