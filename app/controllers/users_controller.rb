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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  def login
    if current_user
      render :json => @user
    else
      redirect_to '/401'
    end
  end

  def new_session
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ['Login credentials not valid.']
      render template: 'users/login'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
