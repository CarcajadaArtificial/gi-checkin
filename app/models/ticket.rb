class Ticket < ApplicationRecord

def self.createTickets(typeId, quantity)
  n = Integer(quantity, 10)
  for i in 0..n
    for ff in 0..5
      randomRef= SecureRandom.hex(3)
      if Ticket.where(:ticket_reference => randomRef) == []
        ff = 5
        @tempTicket= Ticket.create(:ticket_reference => randomRef, :ticket_ticketTypeId => typeId)
        @tempTicket.save
      end
    end
  end
end

end
