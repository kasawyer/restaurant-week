FactoryGirl.define do
  factory :user do
    name "Person"
    password "password1234"
    password_confirmation "password1234"
    email "person@person.com"
  end
end
