class Baggage < ApplicationRecord
  belongs_to :ticket

  validates :tag_number, presence: true, uniqueness: true
  validates :weight_kg,
            numericality: { greater_than: 0 }
end
