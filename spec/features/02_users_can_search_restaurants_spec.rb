require "rails_helper"

feature "user visits home page" do
  let!(:blue_ginger) { FactoryGirl.create(:restaurant) }
  let!(:bricco) do
    FactoryGirl.create(:restaurant,
      name: "BRICCO",
      region: "Boston - North End",
      lunch_price: "NA",
      dinner_price: "NA",
      cuisine: "Italian")
  end
  let!(:thoreau) do
    FactoryGirl.create(:restaurant,
      name: "80 Thoreau",
      region: "Greater Boston - West",
      cuisine: "American",
      lunch_price: "NA",
      dinner_price: "$38")
  end
  let!(:maison) do
    FactoryGirl.create(:restaurant,
      name: "Ma Maison",
      region: "Boston - Beacon Hill",
      cuisine: "French",
      lunch_price: "$20",
      dinner_price: "$33")
  end

  scenario "user sees list of all restaurants" do

    visit "/restaurants"

    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "BRICCO"
    expect(page).to have_content "80 Thoreau"
    expect(page).to have_content "Ma Maison"
  end

  scenario "user searches for restaurants by region" do

    visit "/restaurants"

    select "Boston - Beacon Hill"
    click_button "Search"

    expect(page).to have_content("Ma Maison")
    expect(page).to_not have_content("BRICCO")
    expect(page).to_not have_content("80 Thoreau")
    expect(page).to_not have_content("Blue Dragon")
  end

  scenario "user searches for restaurants by cuisine" do

    visit "/restaurants"

    select "Asian"
    click_button "Search"

    expect(page).to have_content("Blue Dragon")
    expect(page).to_not have_content("BRICCO")
    expect(page).to_not have_content("80 Thoreau")
    expect(page).to_not have_content("Ma Maison")
  end

  scenario "user searches for restaurants by lunch price" do

    visit "/restaurants"

    select "$20"
    click_button "Search"

    expect(page).to have_content("Blue Dragon")
    expect(page).to have_content("Ma Maison")
    expect(page).to_not have_content("BRICCO")
    expect(page).to_not have_content("80 Thoreau")
  end

  scenario "user searches for restaurants by dinner price" do

    visit "/restaurants"

    select "$38"
    click_button "Search"

    expect(page).to have_content("Blue Dragon")
    expect(page).to have_content("80 Thoreau")
    expect(page).to_not have_content("BRICCO")
    expect(page).to_not have_content("Ma Maison")
  end

  scenario "user searches for restaurants by keyword" do

    visit "/restaurants"

    fill_in "Name of restaurant", with: "80"
    click_button "Search"

    expect(page).to have_content("80 Thoreau")
    expect(page).to_not have_content("Blue Dragon")
    expect(page).to_not have_content("BRICCO")
    expect(page).to_not have_content("Ma Maison")
  end
end
