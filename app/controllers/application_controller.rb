class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def rescue_with_resource_not_found(exception)
    render inline: "<h2>#{exception.message}</h2>"
  end
end
