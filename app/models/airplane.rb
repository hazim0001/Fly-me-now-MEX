class Airplane < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :ratings
  has_many_attached :photos

  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, inclusion: { in: (0.0..5.0) }, numericality: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
