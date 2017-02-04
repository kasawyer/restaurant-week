FactoryGirl.define do
  factory :restaurant do
    name "Blue Dragon"
    image_url "https://res-1.cloudinary.com/simpleview/image/fetch/c_fill,f_auto,h_202,q_60,w_267/https://boston.simpleviewcrm.com/images/listings/original_BlueDragonLunchSalmon0.jpg"
    # rubocop:enable LineLength
    region "Boston - Fort Point"
    address "324 A Street Boston, MA 02210"
    cuisine "Asian"
    lunch_price "$20"
    lunch_menu_link "https://boston.simpleviewcrm.com/docs/amenities/BD%20Dine%20Out%20Lunch%2020171.pdf"
    dinner_price "$38"
    dinner_menu_link "https://boston.simpleviewcrm.com/docs/amenities/BD%20Dine%20Out%20Dinner%202017.pdf"
    special_notes "Open daily"
  end
end
