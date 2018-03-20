class User < ApplicationRecord

  has_one :contractor, dependent: :destroy
  has_one :client, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create_commit :create_profile,

  def create_profile
    Client.new(user: self).save
    Contractor.new(user: self).save
  end
end
