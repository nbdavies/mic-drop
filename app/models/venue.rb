class Venue < ActiveRecord::Base
  belongs_to :type
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  belongs_to :manager, class_name: "User"
  has_many :events
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
end
