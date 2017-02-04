require "rails_helper"

feature "user visits home page" do
  let!(:thoreau) { FactoryGirl.create(:restaurant, name: "80 Thoreau") }
  let!(:a_tavola) { FactoryGirl.create(:restaurant, name: "A Tavola") }
  let!(:abby_park) { FactoryGirl.create(:restaurant, name: "Abby Park") }
  let!(:amelias) { FactoryGirl.create(:restaurant, name: "Amelia's Stoughton") }
  let!(:antico) { FactoryGirl.create(:restaurant, name: "Antico Forno") }
  let!(:aria) { FactoryGirl.create(:restaurant, name: "Aria Trattoria") }
  let!(:art) { FactoryGirl.create(:restaurant, name: "Artistry on the Green") }
  let!(:artu) { FactoryGirl.create(:restaurant, name: "Artu") }
  let!(:back) { FactoryGirl.create(:restaurant, name: "Back Bay Harry's") }
  let!(:bistro_five) { FactoryGirl.create(:restaurant, name: "Bistro 5") }
  let!(:bistro_midi) { FactoryGirl.create(:restaurant, name: "Bistro du Midi") }
  let!(:blu) { FactoryGirl.create(:restaurant, name: "Blu Restaurant") }
  let!(:blue_ginger) { FactoryGirl.create(:restaurant) }
  let!(:bos) { FactoryGirl.create(:restaurant, name: "Bostonia Public House") }
  let!(:bricco) { FactoryGirl.create(:restaurant, name: "BRICCO") }
  let!(:bronwyn) { FactoryGirl.create(:restaurant, name: "Bronwyn") }
  let!(:clink) { FactoryGirl.create(:restaurant, name: "CLINK.") }
  let!(:central) { FactoryGirl.create(:restaurant, name: "Central Bistro") }
  let!(:chr) { FactoryGirl.create(:restaurant, name: "Chart House Restaurant") }
  let!(:city_table) { FactoryGirl.create(:restaurant, name: "City Table") }
  let!(:vinci) { FactoryGirl.create(:restaurant, name: "Da Vinci Ristorante") }
  let!(:maison) { FactoryGirl.create(:restaurant, name: "Ma Maison") }
  let!(:o_ya) { FactoryGirl.create(:restaurant, name: "O Ya") }

  scenario "user sees first ten restaurants on home page" do

    visit "/restaurants"

    expect(page).to have_content "80 Thoreau"
    expect(page).to have_content "A Tavola"
    expect(page).to have_content "Abby Park"
    expect(page).to have_content "Amelia's Stoughton"
    expect(page).to have_content "Antico Forno"
    expect(page).to have_content "Aria Trattoria"
    expect(page).to have_content "Artistry on the Green"
    expect(page).to have_content "Artu"
    expect(page).to have_content "Back Bay Harry's"
    expect(page).to have_content "Bistro 5"
    expect(page).to_not have_content "Bistro du Midi"
    expect(page).to_not have_content "Blu Restaurant"
    expect(page).to_not have_content "Blue Dragon"
    expect(page).to_not have_content "Bostonia Public House"
    expect(page).to_not have_content "BRICCO"
    expect(page).to_not have_content "Bronwyn"
    expect(page).to_not have_content "CLINK."
    expect(page).to_not have_content "Central Bistro"
    expect(page).to_not have_content "Chart House Restaurant"
    expect(page).to_not have_content "City Table"
    expect(page).to_not have_content "Da Vinci Ristorante"
    expect(page).to_not have_content "Ma Maison"
    expect(page).to_not have_content "O Ya"
  end

  scenario "user sees more restaurants on next page" do

    visit "/restaurants"
    first(:link, "Next").click

    expect(page).to have_content "Bistro du Midi"
    expect(page).to have_content "Blu Restaurant"
    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "Bostonia Public House"
    expect(page).to have_content "BRICCO"
    expect(page).to have_content "Bronwyn"
    expect(page).to have_content "CLINK."
    expect(page).to have_content "Central Bistro"
    expect(page).to have_content "Chart House Restaurant"
    expect(page).to have_content "City Table"
    expect(page).to_not have_content "80 Thoreau"
    expect(page).to_not have_content "A Tavola"
    expect(page).to_not have_content "Abby Park"
    expect(page).to_not have_content "Amelia's Stoughton"
    expect(page).to_not have_content "Antico Forno"
    expect(page).to_not have_content "Aria Trattoria"
    expect(page).to_not have_content "Artistry on the Green"
    expect(page).to_not have_content "Artu"
    expect(page).to_not have_content "Back Bay Harry's"
    expect(page).to_not have_content "Bistro 5"
    expect(page).to_not have_content "Da Vinci Ristorante"
    expect(page).to_not have_content "Ma Maison"
    expect(page).to_not have_content "O Ya"
  end

  scenario "user sees the final restaurants on the last page" do
    visit "/restaurants"
    first(:link, "Last").click

    expect(page).to have_content "Da Vinci Ristorante"
    expect(page).to have_content "Ma Maison"
    expect(page).to have_content "O Ya"
    expect(page).to_not have_content "80 Thoreau"
    expect(page).to_not have_content "A Tavola"
    expect(page).to_not have_content "Abby Park"
    expect(page).to_not have_content "Amelia's Stoughton"
    expect(page).to_not have_content "Antico Forno"
    expect(page).to_not have_content "Aria Trattoria"
    expect(page).to_not have_content "Artistry on the Green"
    expect(page).to_not have_content "Artu"
    expect(page).to_not have_content "Back Bay Harry's"
    expect(page).to_not have_content "Bistro 5"
    expect(page).to_not have_content "Bistro du Midi"
    expect(page).to_not have_content "Blu Restaurant"
    expect(page).to_not have_content "Blue Dragon"
    expect(page).to_not have_content "Bostonia Public House"
    expect(page).to_not have_content "BRICCO"
    expect(page).to_not have_content "Bronwyn"
    expect(page).to_not have_content "CLINK."
    expect(page).to_not have_content "Central Bistro"
    expect(page).to_not have_content "Chart House Restaurant"
    expect(page).to_not have_content "City Table"
  end

  scenario "user sees the previous ten restaurants on the previous page" do
    visit "/restaurants"
    first(:link, "3").click
    first(:link, "Prev").click

    expect(page).to have_content "Bistro du Midi"
    expect(page).to have_content "Blu Restaurant"
    expect(page).to have_content "Blue Dragon"
    expect(page).to have_content "Bostonia Public House"
    expect(page).to have_content "BRICCO"
    expect(page).to have_content "Bronwyn"
    expect(page).to have_content "CLINK."
    expect(page).to have_content "Central Bistro"
    expect(page).to have_content "Chart House Restaurant"
    expect(page).to have_content "City Table"
    expect(page).to_not have_content "80 Thoreau"
    expect(page).to_not have_content "A Tavola"
    expect(page).to_not have_content "Abby Park"
    expect(page).to_not have_content "Amelia's Stoughton"
    expect(page).to_not have_content "Antico Forno"
    expect(page).to_not have_content "Aria Trattoria"
    expect(page).to_not have_content "Artistry on the Green"
    expect(page).to_not have_content "Artu"
    expect(page).to_not have_content "Back Bay Harry's"
    expect(page).to_not have_content "Bistro 5"
    expect(page).to_not have_content "Da Vinci Ristorante"
    expect(page).to_not have_content "Ma Maison"
    expect(page).to_not have_content "O Ya"
  end

  scenario "user sees first ten restaurants on first page" do

    visit "/restaurants"
    first(:link, "Last").click
    first(:link, "First").click

    expect(page).to have_content "80 Thoreau"
    expect(page).to have_content "A Tavola"
    expect(page).to have_content "Abby Park"
    expect(page).to have_content "Amelia's Stoughton"
    expect(page).to have_content "Antico Forno"
    expect(page).to have_content "Aria Trattoria"
    expect(page).to have_content "Artistry on the Green"
    expect(page).to have_content "Artu"
    expect(page).to have_content "Back Bay Harry's"
    expect(page).to have_content "Bistro 5"
    expect(page).to_not have_content "Bistro du Midi"
    expect(page).to_not have_content "Blu Restaurant"
    expect(page).to_not have_content "Blue Dragon"
    expect(page).to_not have_content "Bostonia Public House"
    expect(page).to_not have_content "BRICCO"
    expect(page).to_not have_content "Bronwyn"
    expect(page).to_not have_content "CLINK."
    expect(page).to_not have_content "Central Bistro"
    expect(page).to_not have_content "Chart House Restaurant"
    expect(page).to_not have_content "City Table"
    expect(page).to_not have_content "Da Vinci Ristorante"
    expect(page).to_not have_content "Ma Maison"
    expect(page).to_not have_content "O Ya"
  end
end
