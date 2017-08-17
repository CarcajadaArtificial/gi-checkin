class TicketTypeConference < ApplicationRecord
  belongs_to :Ticket_Type
  belongs_to :Conference
end
