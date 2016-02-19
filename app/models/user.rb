class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :rsvps
  has_many :subscriptions
  has_one :venue, foreign_key: "manager_id"
end
