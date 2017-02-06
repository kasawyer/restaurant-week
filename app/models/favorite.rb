class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :marked, presence: true
  validates :user, presence: true
  validates :restaurant, presence: true
  validates :marked, inclusion: { in: [true, false] }
end
