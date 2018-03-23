class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :client
  has_one :contractor, through: :service
  has_many :reviews, dependent: :destroy

  validates :date, presence: true

  def self.link_contractor(contractor)
    joins(:service).where(services: { contractor: contractor })
  end
end
