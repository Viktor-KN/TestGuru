class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:greeting] = I18n.t('hello', first_name: current_user.first_name)
  end
end
