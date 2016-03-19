class EventsController < ApplicationController
  def create
    @event = Event.create(name: event_params[:name],
                      venue_id: event_params[:venue_id],
                          date: event_params[:date],
                    start_time: event_params[:start_time],
                      end_time: event_params[:end_time],
                   description: event_params[:description],
                         photo: event_params[:photo])
    if event_params[:tags]
      tags = event_params[:tags].split(", ")
      tags.each do |tag|
        @event.tags.find_or_create_by(name: tag)
      end
    end
    render :json => @event
  end

  def index
    events = Event.where(date: Date.today)
    pins = events.to_a.map{ |event| event.pin(current_user)}
    pins.select!{|pin| pin[:date] == Date.today}
    render :json => pins
  end

  def show
    subs = Subscription.where(user_id: current_user.id)
    events = []
    subs.each do |sub|
      if Event.find_by(venue_id: sub.venue_id)
        subscribed_events = Event.where(venue_id: sub.venue_id)
        subscribed_events.each do |event|
          events << event if event.date == Date.today
        end
      end
    end
    pins = events.map{ |event| event.pin(current_user) }
    render json: pins
  end

  private

  def event_params
    params.require(:event).permit(:venue_id, :name, :date, :start_time, :end_time, :description, :photo, :tags)
  end

end
