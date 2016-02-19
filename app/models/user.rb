class User < ActiveRecord::Base
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :rsvps
  has_many :subscriptions
  has_many :venues, foreign_key: "manager_id"
end
