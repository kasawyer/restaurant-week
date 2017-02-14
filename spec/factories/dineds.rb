FactoryGirl.define do
  factory :dined do
    marked true

    user
    restaurant
  end
end
