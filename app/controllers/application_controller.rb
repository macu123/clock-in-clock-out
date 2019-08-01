class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    unless current_user
      redirect_to login_url, notice: "You're not authorized to perform this action."
    end
  end
end
