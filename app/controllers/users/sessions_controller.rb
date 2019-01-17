class Users::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:greeting, 'hello', first_name: current_user.first_name)
  end
end
