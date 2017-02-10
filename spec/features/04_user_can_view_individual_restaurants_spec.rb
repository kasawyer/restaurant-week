require 'spec_helper'

feature "user visits a restaurant page" do
  let!(:blue_ginger) { FactoryGirl.create(:restaurant) }
  let!(:o_ya) { FactoryGirl.create(:restaurant, name: "O Ya") }

  xscenario "user visits show page for Blue Ginger" do
    visit restaurant_path(blue_ginger)

    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "Boston - Fort Point"
    expect(page).to have_content "324 A Street Boston, MA 02210"
    expect(page).to have_content "Asian"
    expect(page).to have_content "$20"
    expect(page).to have_content "$38"
    expect(page).to have_content "Open daily"
  end

  xscenario "user can click a link back to index page" do
    visit restaurant_path(blue_ginger)
    click_on "Back to restaurants"

    expect(page).to have_content("O Ya")
    expect(page).to have_content("Participating restaurants")
  end
end
