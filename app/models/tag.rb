class Tag < ActiveRecord::Base
  has_many :event_venue_tags

  # belongs_to :taggable, polymorphic: true
  # belongs_to :venue
  # belongs_to :event
  has_many :venues, through: :event_venue_tags, source: :taggable, source_type: 'Venue'
  has_many :events, through: :event_venue_tags, source: :taggable, source_type: 'Event'
end
