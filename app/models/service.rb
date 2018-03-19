class Service < ApplicationRecord
  belongs_to :contractor
  has_many :pictures, as: :picturable
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true

end
