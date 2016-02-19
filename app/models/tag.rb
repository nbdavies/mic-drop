class Tag < ActiveRecord::Base
  has_many :event_venue_tags
  has_many :venues, through: :event_venue_tags, as: :taggable
  has_many :events, through: :event_venue_tags, as: :taggable
end
