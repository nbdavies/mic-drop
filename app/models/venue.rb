class Venue < ActiveRecord::Base
  belongs_to :type
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  belongs_to :manager, class_name: "User"
  has_many :events
  has_many :event_venue_tags, as: :taggable
  has_many :tags, through: :event_venue_tags
  has_attached_file :photo, 
                    styles: { :medium => "200x200>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
