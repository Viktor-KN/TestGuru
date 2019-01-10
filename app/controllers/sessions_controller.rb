class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    return redirect_to root_path if logged_in?
  end

  def create
    return redirect_to root_path if logged_in?

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
    cookies[:redirect_path] || root_path
  end
end
