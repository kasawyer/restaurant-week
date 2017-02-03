class Restaurant < ApplicationRecord
  CUISINES = [
    ["Cuisine", ""],
    ["Afghan", "Afghan"],
    ["American", "American"],
    ["Argentinian", "Argentinian"],
    ["Asian", "Asian"],
    ["Barbeque"],
    ["Brazilian Steakhouse"],
    ["British"],
    ["Continental"],
    ["Contemporary American"],
    ["Fondue"],
    ["French"],
    ["French/Cambodian"],
    ["Fusion"],
    ["Indian"],
    ["International"],
    ["Irish"],
    ["Italian"],
    ["Japanese"],
    ["Latin"],
    ["Mediterranean"],
    ["Mexican"],
    ["Moroccan"],
    ["New England Cuisine"],
    ["Persian"],
    ["Seafood"],
    ["Southwestern"],
    ["Spanish"],
    ["Steakhouse"],
    ["Sushi"],
    ["Thai"],
    ["Tapas"]
  ]

  REGIONS = [
    ["Region", ""],
    ["Boston - Back Bay"],
    ["Boston - Beacon Hill"],
    ["Boston - Brookline"],
    ["Boston - Charlestown"],
    ["Boston - Dorchester"],
    ["Boston - Downtown/Financial District"],
    ["Boston - Airport/Chelsea/Revere"],
    ["Boston - Fenway/Kenmore"],
    ["Boston - Fort Point"],
    ["Boston - North End"],
    ["Boston - Roslindale/West Roxbury/Hyde Park"],
    ["Boston - Somerville"],
    ["Boston - Seaport District"],
    ["Boston - South End"],
    ["Boston - South Boston"],
    ["Boston - Theatre District/Chinatown"],
    ["Boston - Waterfront"],
    ["Boston - West End"],
    ["Cambridge - Cambridgeport"],
    ["Cambridge - Central Square"],
    ["Cambridge - East Cambridge"],
    ["Cambridge - Harvard Square"],
    ["Cambridge - Inman Square"],
    ["Cambridge - Kendall Square"],
    ["Cambridge - Porter Square"],
    ["Cambridge - West Cambridge"],
    ["Greater Boston - North"],
    ["Greater Boston - South"],
    ["Greater Boston - West"],
    ["New England"],
    ["Citywide"]
  ]

  LUNCH_PRICES = [
    ["Lunch price", ""],
    ["$15"],
    ["$20"],
    ["$25"]
  ]

  DINNER_PRICES = [
    ["Dinner price", ""],
    ["$28"],
    ["$33"],
    ["$38"]
  ]

  has_many :reviews

  validates :name, presence: true
  validates :image_url, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true

  def self.search(search)
    search.delete_if{|key, value| value.empty? }
    if search[:keyword]
      where(search) && where("name ILIKE ?, OR cuisine ILIKE ? OR region ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where(search)
    end
  end

  # def self.keyword(search)
  #   where("name ILIKE ?, OR cuisine ILIKE ? OR region ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  # end

  # def self.search(search)
  #   where("name ILIKE ?, OR cuisine ILIKE ? OR lunch_price ILIKE ? OR dinner_price ILIKE ? OR region ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  # end
end
