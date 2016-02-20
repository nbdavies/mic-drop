class EventsController < ApplicationController

  def index
    pins = Event.all
    pins.to_a.map!{ |pin| pin.attributes.to_options}
    pins.each do |pin|
      venue = Venue.find(pin[:venue_id])
      pin["location"] = {lat: venue.lat, lng: venue.lng}
    end
    render :json => pins
  end

end
