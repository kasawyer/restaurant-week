require 'spec_helper'

feature "user edits an account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user successfully edits an account" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password1234"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "Name", with: "Person 1"
    fill_in "Email", with: "person1@person.com"
    attach_file('user_avatar', Rails.root + "spec/images/person1.png")
    fill_in "Current password", with: "password1234"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."

    click_on "Account settings"

    expect(find_field('Name').value).to eq 'Person 1'
    expect(find_field('Email').value).to eq 'person1@person.com'
  end

  scenario "user successfully delete an account" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password1234"

    click_button "Sign in"
    click_on "Account settings"

    click_button "Delete account"

    expect(page).to have_content "Bye! Your account has been successfully
      cancelled. We hope to see you again soon."
  end

  scenario "user successfully changes password" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password1234"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "New password", with: "password"
    fill_in "Confirm new password", with: "password"
    fill_in "Current password", with: "password1234"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "user successfully has changed a password" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password1234"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "New password", with: "password"
    fill_in "Confirm new password", with: "password"
    fill_in "Current password", with: "password1234"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."

    click_on "Account settings"

    fill_in "Current password", with: "password"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end
end
