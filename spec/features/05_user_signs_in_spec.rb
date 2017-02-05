require 'spec_helper'

feature "user creates an account" do

  scenario "user signs up for new account successfully" do
    visit "/"
    click_on "Sign up"

    fill_in "Name", with: "Person"
    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"

    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user tries to create an account with an unavailable email" do
    visit "/"
    click_on "Sign up"

    fill_in "Name", with: "Person"
    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"

    click_button "Sign up"

    visit "/"
    click_on "Sign out"
    click_on "Sign up"

    fill_in "Name", with: "Person"
    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"
    click_button "Sign up"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "user tries to create an account with invalid email format" do
    visit "/"
    click_on "Sign up"

    fill_in "Email", with: "persongmail.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"

    click_button "Sign up"

    expect(page).to have_content "Email is invalid"
  end

  scenario "user tries to create an account without name, email or password" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: ""

    click_button "Sign up"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "user can sign in again after creating an account" do
    FactoryGirl.create(:user)

    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Signed in as Person"
    expect(page).to have_content "Sign out"
  end

  scenario "user can sign out" do
    FactoryGirl.create(:user)

    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    click_on "Sign out"
    expect(page).to have_content "Sign in"
  end

  scenario "user can't sign in with invalid password" do
    visit '/'
    click_on "Sign in"

    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password"

    click_button 'Sign in'
    expect(page).to have_content "Invalid Email or password"
  end

  scenario "user creates an account with an avatar" do
    visit '/'
    click_on "Sign up"

    fill_in "Name", with: "Person"
    fill_in "Email", with: "person@person.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"
    attach_file('user_avatar', Rails.root + 'spec/images/person.png')
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
