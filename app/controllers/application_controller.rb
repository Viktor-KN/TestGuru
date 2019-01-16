class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

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

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def rescue_with_resource_not_found(exception)
    render inline: "<h2>#{exception.message}</h2>"
  end
end
