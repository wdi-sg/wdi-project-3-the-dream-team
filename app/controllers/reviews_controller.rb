class ReviewsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @reviews = Review.all
  end

  def new
    @event = Event.find(params[:event_id])
    @new_review = Review.new
  end

  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event_id = @event.id
    @review.craftee_id = current_craftee.id
    if @review.save
      flash[:notice] = 'Review has been saved'
      redirect_to event_path(@event)
    else
      flash[:alert] = 'Review has not been saved'
      render 'new'
    end
  end

  def update
    if(@review.update(review_params))
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    if @review.destroy
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
