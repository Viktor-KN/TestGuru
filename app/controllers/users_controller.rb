class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    return redirect_to root_path if logged_in?

    @user = User.new
  end

  def create
    return redirect_to root_path if logged_in?

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
