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
end
