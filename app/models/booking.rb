class Booking < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :airplane
  enum status: {
    accepted: 'accepted',
    pending: 'pending',
    denied: 'denied'
  }

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_cannot_be_in_the_past, :end_time_cannot_be_in_the_past, :start_time_cannot_be_greater_than_end_time

  def start_time_cannot_be_in_the_past
    errors.add(start_time, "Start time can't be in the past") if (start_time.present? && start_time) < Time.now
  end

  def end_time_cannot_be_in_the_past
    errors.add(end_time, "End time can't be in the past") if (end_time.present? && end_time) < Time.now
  end

  def start_time_cannot_be_greater_than_end_time
    errors.add(start_time, "End date must be greater than start date") if start_time >= end_time
  end
end
