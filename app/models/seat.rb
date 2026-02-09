class Seat < ApplicationRecord
  belongs_to :aircraft

  has_many :tickets

  enum cabin_class: {
    economy: 0,
    business: 1,
    first: 2
  }, _prefix: :cabin

  validates :seat_number, presence: true
  validates :seat_number, uniqueness: { scope: :aircraft_id }
  validates :cabin_class, presence: true
end
