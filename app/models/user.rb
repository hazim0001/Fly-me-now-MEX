class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :airplanes, foreign_key: :owner_id
  has_many :ratings, foreign_key: :renter_id
  has_many :bookings, foreign_key: :renter_id

  validates :role, presence: true, inclusion: { in: %w[owner renter] }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :passport_number, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
