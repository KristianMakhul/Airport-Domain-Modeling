class Passenger < ApplicationRecord
  has_many :tickets

  validates :first_name,
            :last_name,
            :document_number,
            presence: true
end
