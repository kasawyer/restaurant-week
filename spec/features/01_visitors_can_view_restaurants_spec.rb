require "rails_helper"

feature "user visits home page" do
  let!(:blue_ginger) { FactoryGirl.create(:restaurant) }
  let!(:o_ya) { FactoryGirl.create(:restaurant, name: "O Ya") }

  scenario "user sees list of all restaurants" do

    visit "/restaurants"

    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "Boston - Fort Point"
    expect(page).to have_content "324 A Street Boston, MA 02210"
    expect(page).to have_content "Asian"
    expect(page).to have_content "$20"
    expect(page).to have_content "$38"
    expect(page).to have_content "Open daily"
    expect(page).to have_content "O Ya"
  end

  scenario "podcasts are listed in alphabetical order" do

    visit "/restaurants"

    expect(page).to have_selector("ul.restaurant-info li:nth-child(1)", visible: blue_ginger.name)
    expect(page).to have_selector("ul.restaurant-info li:nth-child(2)", visible: o_ya.name)
  end
end
