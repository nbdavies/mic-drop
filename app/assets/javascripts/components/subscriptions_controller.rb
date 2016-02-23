class SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.find_by(user_id: current_user.id)
  end

  private

end
