class Review < ApplicationRecord
  has_many :pictures, as: :picturable
  belongs_to :booking

  validates :rating, presence: true, inclusion: {in: (0..5)}
  validates :description, presence: true
end
