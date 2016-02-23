class EventsController < ApplicationController
  def create
    @event = Event.create(event_params)
    render :json => @event
  end

  def index
    events = Event.all
    pins = events.to_a.map{ |event| event.pin}
    pins.select!{|pin| pin[:date] == Date.today}
    render :json => pins
  end

  private
  def event_params
    params.require(:event).permit(:venue_id, :name, :date, :start_time, :end_time, :description)
  end

end
