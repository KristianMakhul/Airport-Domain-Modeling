class Booking < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :pnr, presence: true, uniqueness: true
end
