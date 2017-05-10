class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show filter search search_enter]

  before_action :find_event, except: %i[index new create filter search search_enter filter_paginate]
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
      @filtered = Event.all.paginate(:page => params[:page], :per_page => 15)
    else
      @filtered = Event.where(category_id: params[:category_id]).paginate(:page => params[:page], :per_page => 15)
    end
    @category_id = params[:category_id]

    respond_to do |format|
      format.js
      # format.json { render json: {  success: true,
      #                               data: @filtered }}
    end
  end

  def filter_paginate
    if !params[:category_id] || params[:category_id] == ''
      @all_events = Event.all.paginate(:page => params[:page], :per_page => 15)
    else
      @all_events = Event.where(category_id: params[:category_id]).paginate(:page => params[:page], :per_page => 15)
    end
    @categories = Category.all
    render 'events/index'
  end

  def search

    p 'search request received'
    p params
    p 'hi'

    @search_events = Event.joins(:crafter)
    .where('crafters.name ~* ?', params[:search_input])
    .or(Event.joins(:crafter)
    .where('events.name ~* ?', params[:search_input]))

    p @search_events.inspect

    respond_to do |format|
      format.js
      format.json { render json: { success: true, data: @search_events }}
    end
  end

  def search_enter
    @filtered = Event.joins(:crafter)
    .where('crafters.name ~* ? or events.name ~* ?', params[:search_input], params[:search_input])

    respond_to do |format|
      format.js { render action: 'filter' }
    end
  end

  def my_events
    #code
    @crafter = Crafter.find(params[:id])
    @crafterEvents = @crafter.events
    @categories = Category.all
    @all_events = @crafterEvents.paginate(:page => params[:page], :per_page => 15)
    render 'events/index'
  end

  helper_method :check_time

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
