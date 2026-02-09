class BoardingPass < ApplicationRecord
  belongs_to :ticket

  validate :ticket_checked_in_and_has_seat

  private

  def ticket_checked_in_and_has_seat
    unless ticket.checked_in && ticket.seat.present?
      errors.add(:base, "Ticket must be checked in and seat assigned")
    end
  end
end
