class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
  belongs_to :venue
end
