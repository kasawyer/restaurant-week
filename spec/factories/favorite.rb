FactoryGirl.define do
  factory :favorite do
    marked true

    user
    restaurant
  end
end
