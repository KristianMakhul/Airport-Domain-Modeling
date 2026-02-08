class GateAssignment < ApplicationRecord
  belongs_to :gate
  belongs_to :flight_instance

  validates :active_from, :active_to, presence: true
  validate :no_time_overlap

  private

  def no_time_overlap
    overlapping = GateAssignment
      .where(gate_id: gate_id)
      .where.not(id: id)
      .where("active_from < ? AND active_to > ?", active_to, active_from)

    if overlapping.exists?
      errors.add(:base, "Gate already assigned in this time range")
    end
  end
end
