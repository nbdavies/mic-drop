class SubscriptionsController < ApplicationController

  def index
    venues = []
    subscriptions = Subscription.where(user_id: current_user.id)
    subscriptions.each do |sub|
      venues << Venue.find_by(venue_id: sub.venue_id)
    end
    p ")))))))))))))))))))))))))))))))))))))"
    p venues
  end
end
