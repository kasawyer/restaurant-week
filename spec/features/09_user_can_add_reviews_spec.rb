require 'rails_helper'

feature 'users can add reviews' do
  let!(:blue_dragon) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user adds new review successfully' do
    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit restaurant_path(blue_dragon)

    expect(page).to have_content 'Add a review'

    fill_in 'Rating', with: 5
    fill_in 'Review', with: 'Such a great restaurant for Dine Out!'

    click_button 'Add review'
    expect(page).to have_content 'Review added successfully!'
  end

  scenario 'visitor does not provide necessary information for review' do
    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"
    visit restaurant_path(blue_dragon)
    expect(page).to have_content 'Add a review'

    fill_in 'Rating', with: ''
    fill_in 'Review', with: ''

    click_button 'Add review'

    expect(page).to have_content "Rating can't be blank, Rating is not a\
     number, Rating must be between 1 - 5, and Body can't be blank"
  end
end
