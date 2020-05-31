class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to homepage_path
    end
  end

  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
