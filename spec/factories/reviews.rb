FactoryGirl.define do
  factory :review do
    rating 5
    body "Great restaurant for Dine Out Boston!"

    user
    restaurant
  end
end
