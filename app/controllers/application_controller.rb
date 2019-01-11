class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  def rescue_with_resource_not_found(exception)
    render inline: "<h2>#{exception.message}</h2>"
  end

  private

  def authenticate_user!
    if current_user
      cookies.delete(:redirect_path)
    else
      cookies[:redirect_path] = request.path
      redirect_to login_path, alert: 'Please log in to access this resource'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_to_root
    redirect_to root_path
  end
end
