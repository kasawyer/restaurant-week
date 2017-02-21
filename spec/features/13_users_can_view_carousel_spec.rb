require "rails_helper"

feature "user visits home page" do
  let!(:blue_dragon) { FactoryGirl.create(:restaurant) }
  let!(:o_ya) { FactoryGirl.create(:restaurant, name: "O Ya") }

  scenario "signed-in user sees carousel page" do

    visit "/"

    expect(page).to have_content "All the information you need to make the best
    decisions possible for Boston's restaurant week: Dine Out Boston."

    first(:button, "Enter").click

    expect(page).to have_content "Participating restaurants"
    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "O Ya"
  end

  scenario "non-signed-in user sees carousel page" do

    visit "/"

    expect(page).to have_content "All the information you need to make the best
    decisions possible for Boston's restaurant week: Dine Out Boston."
    expect(page).to have_content "Log in to add reviews and save favorites, or
    continue to view restaurants."

    first(:button, "Enter").click

    expect(page).to have_content "Participating restaurants"
    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "O Ya"

    visit "/"
    first(:button, "Log in").click

    expect(page).to have_content "Log in"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
