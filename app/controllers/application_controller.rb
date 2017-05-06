class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # methods for session authentication, available helper methods can be found below

  # this can be used in other controller's before actions to authenticate crafter
  # redirected back to root path for now.
  # TODO: change redirect path if necessary
  def is_crafter_authenticated
    unless session[:user_type] == 'crafter'
      flash[:notice] = 'You need to switch to/be logged in as a crafter to continue.'
      redirect_to root_path
    end
  end

  def is_crafter_authenticated?
    session[:user_type] == 'crafter' ? true : false
  end

  # this can be used in other controller's before actions to authenticate craftee
  def is_craftee_authenticated
    unless session[:user_type] == 'craftee'
      flash[:notice] = 'You need to switch to/be logged in as a craftee to continue.'
      redirect_to root_path
    end
  end

  def is_craftee_authenticated?
    session[:user_type] == 'craftee' ? true : false
  end

  # crafter object for the currently logged in user
  def current_crafter
    if user_signed_in?
      @current_crafter ||= Crafter.find_by_user_id(current_user.id)
    end
  end

  # craftee object for the currently logged in user
  def current_craftee
    if user_signed_in?
      @current_craftee ||= Craftee.find_by_user_id(current_user.id)
    end
  end

  # user type in the current session for logged in user
  def current_user_type
    session[:user_type]
  end

  # switch the user type in the current session
  def switch_user_type
    if session[:user_type] == 'crafter'
      session[:user_type] = 'craftee'
    elsif session[:user_type] == 'craftee'
      session[:user_type] = 'crafter'
    end
  end

  def crafter_activated?
    current_crafter && current_crafter.name ? true : false
  end

  def my_event?(event)
    if user_signed_in?
      if current_user.crafter.events.include? event
        true
      else
        false
      end
    end
  end

  # helper methods can be called from anywhere including views

  helper_method :current_user_type
  helper_method :current_crafter
  helper_method :current_craftee
  helper_method :is_craftee_authenticated?
  helper_method :is_crafter_authenticated?
  helper_method :crafter_activated?
  helper_method :my_event?
end
