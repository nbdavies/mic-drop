require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :subscriptions }
  it { should have_many :friendships }
  it { should have_many :venues }
  it { should have_many :rsvps }
end

