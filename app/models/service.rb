class Service < ApplicationRecord
  belongs_to :contractor
  has_many :pictures
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  accepts_nested_attributes_for :pictures

  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true

end
