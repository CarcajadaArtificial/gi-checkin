class Ticket < ApplicationRecord
  belongs_to :event

  def self.createTickets(typeId, quantity)
    n = Integer(quantity, 10)
    for i in 1..n
    ff = 0
      while ff < 3 do
        randomRef= SecureRandom.hex(4)
        ff += 1
        randomRef = randomRef.upcase
        if !(Ticket.exists?(:ticket_reference => randomRef))
          ff = 3
          Ticket.create(:ticket_reference => randomRef, :ticket_ticketTypeId => typeId, :event_id => 3)
        else

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
