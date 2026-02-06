class CheckInCounter < ApplicationRecord
  belongs_to :terminal

  has_many :check_in_assignments, dependent: :destroy

  validates :code, presence: true
  validates :code, uniqueness: { scope: :terminal_id }
end
