class SessionsController < ApplicationController
  protect_from_forgery

  def create
    @user = User.find_by(username: session_params[:username])
    p "*********************************"
    p params
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render :json => @user
    else
      @errors = ['Login credentials not valid.']
      render :json => @errors
    end
  end

  def index
    render :json => (current_user ? current_user : false)
  end

  def destroy
    session.delete(:user_id)
    render :json => false
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
