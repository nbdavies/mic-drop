class SubscriptionsController < ApplicationController
  def index
    Subscription.find_by(user_id: current_user.id)
  end
end
