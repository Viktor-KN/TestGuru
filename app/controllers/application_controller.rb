class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :user_is_an_admin?

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end

  def user_is_an_admin?
    current_user.is_a?(Admin)
  end

  def after_sign_in_path_for(resource_or_scope)
    if user_is_an_admin?
      stored_location_for(resource_or_scope) || admin_tests_path
    else
      super(resource_or_scope)
    end
  end

  def rescue_with_resource_not_found(exception)
    render inline: "<h2>#{exception.message}</h2>"
  end
end
