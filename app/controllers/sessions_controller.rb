class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :redirect_to_root, if: :logged_in?, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to destination_path
    else
      flash.now[:alert] = 'User email or password incorrect'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def destination_path
    cookies.delete(:redirect_path) || root_path
  end
end
