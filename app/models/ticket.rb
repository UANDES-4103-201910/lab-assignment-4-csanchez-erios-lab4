class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :ensure_ticket_is_creted_in_correct_day

  private
    def ensure_ticket_is_creted_in_correct_day
      t = ticket_type.select(id)
      e = Event.select(:start_date).where(ticket_type_id = t)
      if Date.today < e
        return false
      end

    end
    def no_ticket_can_be_bought
      t = ticket_type.select(id)
      e = Event.select(:start_date).where(ticket_type_id = t)
      o = order.select(created_at) #fecha de creacion de la orden
      # no se puede crear un ticket si la orden asociada se creo despues de el evento del ticket
      if e < o
        return false
      end
    end

end
