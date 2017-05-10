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

  def crafter_is_myself?
    if user_signed_in?
      @crafter == current_user.crafter
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

  def check_for_clash?(sess_to_check)
    current_craftee.sessions.each do |s|
      if sess_to_check.datetime_from.between?(s.datetime_from, s.datetime_to)
        @result = true
      else
        @result = false
      end
    end
    @result
  end

  def my_fav_event?(event_to_check)
    # can be improved. find out how to call craftee.events through fav_events
    if user_signed_in?
      unless current_craftee.fav_events.empty?
        current_craftee.fav_events.each do |e|
          if e.event_id == event_to_check.id
            p 'this is a favourited event'
            return true
          end
          p 'this is not a favourited event'
          return false
        end
      end
      p 'fav_events is empty'
      false
    end
  end

  def my_portfolio_item?(portfolio_item)
    if current_crafter.portfolio_items.include? portfolio_item
      true
    else
      false
    end
  end
  # helper methods can be called from anywhere including views

  helper_method :current_user_type
  helper_method :current_crafter
  helper_method :crafter_is_myself?
  helper_method :current_craftee
  helper_method :is_craftee_authenticated?
  helper_method :is_crafter_authenticated?
  helper_method :crafter_activated?
  helper_method :my_event?
  helper_method :my_fav_event?
  helper_method :check_for_clash?
  helper_method :my_portfolio_item?
end
