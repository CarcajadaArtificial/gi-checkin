class TicketConference < ApplicationRecord
  belongs_to :ticket
  belongs_to :conference
end
