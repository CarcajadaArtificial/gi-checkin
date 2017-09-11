class Ticket < ApplicationRecord
  belongs_to :event

  def self.createTickets(typeId, quantity)
    n = Integer(quantity, 10)
      reff = 20000
    for i in 1..n
    ff = 0
      while ff < 3 do
        randomRef= SecureRandom.hex(3)
        reff += 1
        ff += 1
        if !(Ticket.exists?(:ticket_reference => reff))
          puts "no existe"
          ff = 3
          Ticket.create(:ticket_reference => reff, :ticket_ticketTypeId => typeId, :event_id => 1)
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
