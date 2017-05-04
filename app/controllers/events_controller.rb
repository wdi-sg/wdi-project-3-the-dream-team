class EventsController < ApplicationController
  before_action :is_craftee_authenticated, only: [:new, :create, :edit, :update, :destroy]

  def new
    
  end

end
