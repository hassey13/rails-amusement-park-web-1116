class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    redirect_to '/' if !logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :admin, :height, :happiness, :nausea, :tickets)
  end
end
