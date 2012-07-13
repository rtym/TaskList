class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def authenticated?
    !session[:user_id].blank?
  end

  def check_authentication
    unless authenticated?
      flash[:error] = "You must be logged in to access this section"
      redirect_to :log_in
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
