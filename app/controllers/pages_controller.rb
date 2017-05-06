class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about]

  def index
    render 'homepage'
  end

  def about
    render 'about'
  end

  def switch
    switch_user_type
    # using About page as debugging page for now
    # redirect_to about_path
    render 'about'
  end
end
