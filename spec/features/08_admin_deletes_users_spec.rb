require 'spec_helper'

feature "admin can delete users" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:person1) do
    FactoryGirl.create(:user,
      name: "Person 1",
      email: "person1@person.com")
  end
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario "admin views list of users" do
    visit new_admin_session_path

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit users_path

    expect(page).to have_content "All Users"
    expect(page).to have_content "Person"
    expect(page).to have_content "person@person.com"
    expect(page).to have_content "Person 1"
    expect(page).to have_content "person1@person.com"
  end

  scenario "admin deletes a user from list of users" do
    visit new_admin_session_path

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password1234"

    click_button "Sign in"

    visit users_path

    expect(page).to have_content "All Users"
    expect(page).to have_content "Person"
    expect(page).to have_content "person@person.com"
    expect(page).to have_content "Person 1"
    expect(page).to have_content "person1@person.com"

    first(:link, "DELETE").click

    expect(page).to have_content "User was successfully deleted."
    expect(page).to have_content "All Users"
    expect(page).to have_content "Person 1"
    expect(page).to have_content "person1@person.com"
  end
end
