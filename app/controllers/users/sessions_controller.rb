class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:greeting] = "Привет, #{current_user.first_name}!"
  end
end
