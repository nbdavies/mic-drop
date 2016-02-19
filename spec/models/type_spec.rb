require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should have_many :venues }
end
