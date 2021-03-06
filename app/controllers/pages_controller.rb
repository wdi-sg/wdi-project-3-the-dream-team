class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about]

  def index
    # @all_events_pagesC = Event.all
    # @all_crafters_pagesC = Crafter.all
    @all_events_pagesC = FeaturedEvent.all
    @all_crafters_pagesC = FeaturedCrafter.all
    render 'homepage'
  end

  def about
    render 'about'
  end

  def switch
    switch_user_type
    # using About page as debugging page for now
    # redirect_to about_path
    redirect_to :back
  end
end
