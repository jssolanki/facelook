class ApplicationController < ActionController::Base

  before_action :require_login
  helper_method :current_user

  def check_login
    redirect_to user_path(current_user) if session.include? :user_id
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  def require_login
    redirect_to new_session_path unless session.include? :user_id
  end

  private

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
end
