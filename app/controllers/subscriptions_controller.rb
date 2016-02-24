class SubscriptionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    venue = Venue.find_by(name:subscription_params[:venue_name])
    Subscription.create(user_id: current_user.id, venue_id: venue.id)
    render :json => [venue.name, current_user.id]
  end

  def destroy
    venue = Venue.find_by(name:subscription_params[:venue_name])
    sub = Subscription.find_by(user_id: subscription_params[:user_id], venue_id: venue.id)
    sub.destroy
    render :json => [venue.name]
  end

  private
    # def current_user
    #   User.find_by(id: session[:user_id]) if session[:user_id]
    # end

    def subscription_params
      params.require(:subscriptions).permit(:venue_name, :user_id)
    end

end
