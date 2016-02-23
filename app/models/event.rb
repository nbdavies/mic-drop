class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
  belongs_to :venue

  def pin(current_user)
    venue = self.venue
    pin = self.attributes.to_options
    pin["tags"] = (self.tags + venue.tags).uniq
    pin["location"] = {lat: venue.lat, lng: venue.lng}
    pin["address"] = venue.address
    pin["venue_name"] = venue.name
    if current_user
      pin["rsvp"] = true if Rsvp.find_by(user: current_user, event: self)
    end
    pin
  end


end
