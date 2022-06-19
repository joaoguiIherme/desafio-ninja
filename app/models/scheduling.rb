class Scheduling < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_time, :end_time, presence: true, format: { with: /\A((0[1-9]|[12]\d|3[01])-(0[1-9]|1[0-2])-[12]\d{3}) ([01]?[0-9]|2[0-3]):[0-5][0-9]\z/ }
end

# The regex accepts the following string to be able to be parsed like:
# Time.zone.parse("15-08-2022 21:45")
# #=> Mon, 15 Aug 2022 21:45:00.000000000 -03 -03:00
