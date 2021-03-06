class User < ActiveRecord::Base
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :rsvps
  has_many :subscriptions
  has_many :subscribed_venues, through: :subscriptions, source: :venue
  has_many :venues, foreign_key: "manager_id"

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
