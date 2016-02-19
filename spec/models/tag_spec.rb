require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many :venues }
  it { should have_many :events }
end
