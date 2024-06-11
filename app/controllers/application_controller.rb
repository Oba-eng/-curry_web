class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user
  before_action :require_login

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def require_login
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to '/sessions/new'
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
