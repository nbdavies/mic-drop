class SessionsController < ApplicationController
  protect_from_forgery

  def new
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render :json => @user
    else
      @errors = ['Login credentials not valid.']
      render template: 'users/login'
    end
  end

  def index
    render :json => (current_user ? current_user : false)
  end

  def destroy
    session.delete(:user_id)
    render :json => false
  end
end
