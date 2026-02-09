class Ticket < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger
  belongs_to :flight_instance
  belongs_to :seat

  has_one :boarding_pass, dependent: :destroy
  has_many :baggages, dependent: :destroy

  validate :seat_unique_for_flight

  private

  def seat_unique_for_flight
    existing = Ticket
      .where(flight_instance_id: flight_instance_id, seat_id: seat_id)
      .where.not(id: id)

    if existing.exists?
      errors.add(:seat, "already taken for this flight")
    end
  end
end
