class Rating < ApplicationRecord
  belongs_to :airplane
  belongs_to :renter, class_name: 'User'
  validates :rating, inclusion: { in: (1..5) }, presence: true, numericality: { only_integer: true }
end
