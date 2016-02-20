class Venue < ActiveRecord::Base
  belongs_to :type
  has_many :subscriptions
  belongs_to :manager, class_name: "User"
  has_many :events
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
end
