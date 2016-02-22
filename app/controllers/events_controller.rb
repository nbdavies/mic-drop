class EventsController < ApplicationController
  def create
    Event.create(event_params)
  end

  def index
    pins = Event.all
    pins = pins.to_a.map{ |pin| pin.attributes.to_options}
    pins.select!{|pin| pin[:date] == Date.today}
    pins.each do |pin|
      venue = Venue.find(pin[:venue_id])
      pin["location"] = {lat: venue.lat, lng: venue.lng}
      pin["address"] = venue.address
      pin["venue_name"] = venue.name
    end
    render :json => pins
  end

  private
  def event_params
    params.require(:event).permit(:venue_id, :name, :date, :start_time, :end_time, :description)
  end

end
