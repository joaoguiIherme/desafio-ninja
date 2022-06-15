class Room < ApplicationRecord
  has_many :schedulings, dependent: :destroy

  validates :number, :name, presence: true, allow_nil: false
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :number, numericality: { only_integer: true, in: 1..4 }, uniqueness: true
end
