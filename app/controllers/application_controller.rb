class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  
  helper_method :current_user, :logged_in?
  helper_method :current_order
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You have to log in first"
      redirect_to root_path
    end
  end

end
