class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  end

  def after_sign_in_path_for(user)
    if user.admin?
      stored_location_for(user) || admin_tests_path
    else
      super
    end
  end

  def rescue_with_resource_not_found(exception)
    render inline: "<h2>#{exception.message}</h2>"
  end
end
