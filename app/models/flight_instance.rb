class FlightInstance < ApplicationRecord
  belongs_to :flight

  has_many :gate_assignments, dependent: :destroy
  has_many :check_in_assignments, dependent: :destroy
  has_many :tickets, dependent: :destroy

  enum status: {
    scheduled: 0,
    boarding: 1,
    departed: 2,
    arrived: 3,
    delayed: 4,
    cancelled: 5
  }

  validates :scheduled_departure_at,
            :scheduled_arrival_at,
            presence: true

  validate :arrival_after_departure
  validate :actual_times_valid

  private

  def arrival_after_departure
    return if scheduled_arrival_at > scheduled_departure_at

    errors.add(:scheduled_arrival_at,
               "must be after scheduled departure")
  end

  def actual_times_valid
    if actual_departure_at &&
       actual_departure_at < scheduled_departure_at
      errors.add(:actual_departure_at,
                 "cannot be earlier than scheduled")
    end

    if actual_arrival_at &&
       actual_arrival_at < scheduled_arrival_at
      errors.add(:actual_arrival_at,
                 "cannot be earlier than scheduled")
    end
  end
end
