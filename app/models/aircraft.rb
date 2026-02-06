class Aircraft < ApplicationRecord
  belongs_to :airline
  has_many :seats, dependent: :destroy

  validates :model, presence: true
end
