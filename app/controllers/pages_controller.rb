class PagesController < ApplicationController

  def index
    render 'homepage'
  end

  def about
    render 'about'
  end
end
