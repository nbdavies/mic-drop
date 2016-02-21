FactoryGirl.define do
  factory :venue do
    lat  1
    lng  2
    name 'test'
    association :manager, factory: :user
  end
end
