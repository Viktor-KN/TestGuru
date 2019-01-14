class Users::SessionsController < Devise::SessionsController
  def create
    super do
      flash[:greeting] = "Привет, #{current_user.first_name}!"
    end
  end
end
