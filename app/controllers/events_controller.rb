class EventsController < ApplicationController

  def index
    pins = Event.all
    pins.map!(&:to_hash)
    pins.each do |pins|
      venue = Venue.find(pin.venue_id)
      pin["location"] = {lat: venue.lat, lng: venue.lng}
    end
    render :json => pins
  end

end
