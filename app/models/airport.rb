class Airport < ApplicationRecord
  has_many :terminals, dependent: :destroy

  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
