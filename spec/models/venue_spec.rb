require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should have_many :subscriptions }
  it { should have_many :tags }
  it { should belong_to :type }
  it { should belong_to :user }
end
