class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_type
  validates :start_date_cannot_be_in_the_past, :not_two_events_at_same_time
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date , "cant be in the past")
    end
  end
  def not_two_events_at_same_time
    evs = Event.find(event_venue = event.event_venue_id)
    if evs.start_date.each do start_date
      errors.add(:start_date , "cant have the same event venue and date of other event")
    end
    end
  end
end
