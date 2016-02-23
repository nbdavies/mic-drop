class SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.find_by(user_id: )
  end
end
