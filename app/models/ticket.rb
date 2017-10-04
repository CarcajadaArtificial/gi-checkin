class Ticket < ApplicationRecord
  belongs_to :event
  has_many :ticketConferences
  has_many :conferences, through: :ticketConferences

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

  def self.search(ticket, conference, event)
    if ticket
      if conference # Registro de conferencia
        if ticket.registered
          if ticket.conferences.exists?(conference)
            #if conference.conference_attendance <= conference.conference_capacity
              @conf = 1 # Si puede entrar a esta conferencia
            #else
            #  @conf = 5 # La conferencia esta llena
            #end
          else
            @conf = 4 # No tiene acceso a esta conferencia
          end
        else
          @conf = 2 # No esta registrado
        end
      else # Registro de entrada
        if ticket.ticket_preregistered
          ticket.ticket_registered = true
          ticket.save
          @reg = 1 # Esta preregistrado
        else
          @reg = 2 # No esta preregistrado
        end
      end
    else
      @reg = 3 # No existe ticket
      @conf= 3 # No existe ticket
    end
  end


  def self.searchReference(param_reference)
    self.where(:ticket_reference => param_reference).first
  end

end
