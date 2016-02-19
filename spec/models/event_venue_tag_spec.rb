require 'rails_helper'

RSpec.describe EventVenueTag, type: :model do
  it { should belong_to :venue }
  it { should belong_to :event }
  it { should belong_to :tag }
end
