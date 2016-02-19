require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should have_many :rsvps }
  it { should have_many :event_venue_tags }
  it { should have_many :tags }
end
