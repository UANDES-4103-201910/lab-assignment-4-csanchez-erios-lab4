class EventVenue < ApplicationRecord
  validates :name, lenght:{minimun: 20, too_short: "20 characters is the minimun long allowed"}
  validates :capacity, numericality: {greater_than: 0, }
end
