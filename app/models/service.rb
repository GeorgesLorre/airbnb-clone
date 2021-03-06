class Service < ApplicationRecord
  belongs_to :contractor
  has_many :pictures, inverse_of: :service
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  accepts_nested_attributes_for :pictures

  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
