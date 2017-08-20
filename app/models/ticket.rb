class Ticket < ApplicationRecord

def createTickets(typeId,quantity)
  for i in 0..quantity
    randomRef= SecureRandom.hex(3)
    Ticket.create(:ticket_reference => randomRef, :Ticket_Type_id => typeId)
end
end

end
