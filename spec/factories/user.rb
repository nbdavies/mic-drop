FactoryGirl.define do
  factory :user do
    username  {rand(100).to_s}
    password  {rand(1000).to_s}
  end
end
