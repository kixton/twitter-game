class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :is_logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out_user
    session.delete :user_id
  end
end
