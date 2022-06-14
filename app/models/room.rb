class Room < ApplicationRecord
  has_many :schedulings

  validates :number, :name, presence: true, allow_nil: false
  validates :number, numericality: { only_integer: true, in: [1, 2, 3, 4] }, uniquiness: true
end
