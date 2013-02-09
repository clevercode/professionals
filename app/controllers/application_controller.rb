class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:admin_id]
      @current_user ||= Administrator.find(session[:admin_id])
    end
  end

  helper_method :current_user

  def authorize
    redirect_to admin_sign_in_path, alert: 'Not authorized' if current_user.nil?
  end
end
