class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :image_url, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
end
