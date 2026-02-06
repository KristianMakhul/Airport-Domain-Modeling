class Gate < ApplicationRecord
  belongs_to :terminal

  has_many :gate_assignments, dependent: :destroy

  validates :code, presence: true
  validates :code, uniqueness: { scope: :terminal_id }
end
