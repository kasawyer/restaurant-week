require 'rails_helper'

feature 'users can view dineds page' do
  let!(:blue_dragon) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'views dineds page with restaurants marked as dined' do
    FactoryGirl.create(:dined, user: user, restaurant: blue_dragon)

    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_dineds_path(user)

    expect(page).to have_content 'My dined'
    expect(page).to have_content 'Blue Dragon'
  end

  scenario 'visits dineds page without any restaurants marked as dined' do
    visit new_user_session_path

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit user_dineds_path(user)

    expect(page).to have_content 'My dined'
    expect(page).to have_content 'You have no restaurants marked as dined.'
  end
end
