class Flight < ApplicationRecord
  belongs_to :airline

  belongs_to :origin_airport,
             class_name: "Airport"

  belongs_to :destination_airport,
             class_name: "Airport"

  has_many :flight_instances, dependent: :destroy

  validates :flight_number, presence: true
  validates :flight_number, uniqueness: { scope: :airline_id }
end
