require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { has_many :venues }
  it { has_many :events }
end
