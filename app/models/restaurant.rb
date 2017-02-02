class Restaurant < ApplicationRecord
  has_many :reviews
  
  validates :name, presence: true
  validates :image_url, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true

  def self.search(search)
    where("name ILIKE ? OR cuisine ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
