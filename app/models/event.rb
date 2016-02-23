class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
  belongs_to :venue

  def pin
    venue = self.venue
    pin = self.attributes.to_options
    pin["tags"] = (self.tags + venue.tags).uniq
    pin["location"] = {lat: venue.lat, lng: venue.lng}
    pin["address"] = venue.address
    pin["venue_name"] = venue.name
    pin
  end
end
