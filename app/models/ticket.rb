class Ticket < ApplicationRecord
  belongs_to :event
  def self.createTickets(typeId, quantity)
    n = Integer(quantity, 10)
    for i in 0..n
    ff = 0
      while ff < 3
        randomRef= SecureRandom.hex(3)
        ff =ff+1
        if Ticket.where(:ticket_reference => randomRef) == []
          ff = 3
          @tempTicket= Ticket.create(:ticket_reference => randomRef, :ticket_ticketTypeId => typeId)
          @tempTicket.save
        end
      end
    end
  end

  def self.searchReference(param_reference)
    self.where(:ticket_reference => param_reference).first
  end

  def self.searchBadge(param_badge)
    self.where(:ticket_badgeNumber => param_badge).first
  end
end
