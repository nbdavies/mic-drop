class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
  belongs_to :venue
  has_attached_file :photo,
                    styles: { :medium => "200x200>", :thumb => "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg|jpg)/

  def pin(current_user)
    venue = self.venue
    pin = self.attributes.to_options
    pin[:start_time] = pin[:start_time].strftime('%l:%M %p')
    pin[:end_time] = pin[:end_time].strftime('%l:%M %p')
    pin["tags"] = (self.tags + venue.tags).uniq
    pin["location"] = {lat: venue.lat, lng: venue.lng}
    pin["address"] = venue.address
    pin["venue_name"] = venue.name
    if current_user
      pin["rsvp"] = true if Rsvp.find_by(user_id: current_user, event_id: self)
      pin["fav"] = true if Subscription.find_by(user_id: current_user.id, venue_id: venue.id)
      pin["user_id"] = current_user.id
    end
    pin["attendees"] = self.rsvps.count
    pin["photo"] = self.photo.url
    friends_going = []
    if current_user
      self.rsvps.each do |rsvp|
        friends_going << {name: rsvp.user.username, picture_url: rsvp.user.picture_url} if current_user.friends.include?(rsvp.user)
      end
    end
    pin["friends_going"] = friends_going
    p "_________________________________"
     p pin
    pin
  end

end
