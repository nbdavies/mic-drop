class UsersController < ApplicationController
  protect_from_forgery

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render :json => @user
    else
      redirect_to '/401'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end
