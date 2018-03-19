class Contractor < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :bookings, through: :services
end
