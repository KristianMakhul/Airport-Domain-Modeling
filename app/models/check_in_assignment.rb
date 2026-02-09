class CheckInAssignment < ApplicationRecord
  belongs_to :check_in_counter
  belongs_to :flight_instance

  validates :active_from, :active_to, presence: true
  validate :no_time_overlap

  private

  def no_time_overlap
    overlapping = CheckInAssignment
      .where(check_in_counter_id: check_in_counter_id)
      .where.not(id: id)
      .where("active_from < ? AND active_to > ?", active_to, active_from)

    if overlapping.exists?
      errors.add(:base, "Counter already assigned in this time range")
    end
  end
end
