require 'rails_helper'

feature 'users can view reviews page' do
  let!(:blue_dragon) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'views reviews page with reviews' do
    FactoryGirl.create(:review, user: user, restaurant: blue_dragon)

    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_reviews_path(user)

    expect(page).to have_content 'My reviews'
    expect(page).to have_content 'Blue Dragon'
  end

  scenario 'visits reviews page without any reviews' do
    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_reviews_path(user)

    expect(page).to have_content 'My reviews'
    expect(page).to have_content 'You have no reviews.'
  end
end
