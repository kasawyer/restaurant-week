FactoryGirl.define do
  factory :admin do
    name "Admin"
    password "password1234"
    password_confirmation "password1234"
    email "admin@admin.com"
  end
end
