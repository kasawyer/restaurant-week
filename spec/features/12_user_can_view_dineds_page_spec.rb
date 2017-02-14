require 'rails_helper'

feature 'users can view favorites page' do
  let!(:blue_dragon) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'views favorites page with favorites' do
    FactoryGirl.create(:favorite, user: user, restaurant: blue_dragon)

    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_favorites_path(user)

    expect(page).to have_content 'My favorites'
    expect(page).to have_content 'Blue Dragon'
  end

  scenario 'visits favorites page without any favorites' do
    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_favorites_path(user)

    expect(page).to have_content 'My favorites'
    expect(page).to have_content 'You have no favorited restaurants.'
  end
end
