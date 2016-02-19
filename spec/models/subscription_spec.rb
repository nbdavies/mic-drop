require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should belong_to :venue }
  it { should belong_to :user }
end
