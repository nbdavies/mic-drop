class SubscriptionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    venue = Venue.find_by(name:subscription_params[:venue_name])
    Subscription.create(user_id: current_user.id, venue_id: venue.id)
    render :json => venue
  end

  def destroy
    venue = Venue.find_by(name:subscription_params[:venue_name])
    p "++++++++++++++++++++++++++++++++"
    p current_user
    Subscription.find_by(user_id: current_user.id, venue_id: venue.id).destroy
    render :json => venue
  end

  private
    # def current_user
    #   User.find_by(id: session[:user_id]) if session[:user_id]
    # end

    def subscription_params
      params.require(:subscriptions).permit(:venue_name)
    end

end
