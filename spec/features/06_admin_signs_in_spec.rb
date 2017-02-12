require 'spec_helper'

feature "admin signs into account" do
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario "admin can sign in again after creating an account" do

    visit new_admin_session_path

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Signed in as Admin"
    expect(page).to have_content "Admin sign out"
  end

  scenario "admin can sign out" do
    visit new_admin_session_path

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    click_on "Admin sign out"
    click_button("Enter", match: :first)
    expect(page).to have_content "Admin sign in"
  end

  scenario "admin can't sign in with invalid password" do
    visit new_admin_session_path

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password"

    click_button 'Sign in'
    expect(page).to have_content "Invalid Email or password"
  end
end
