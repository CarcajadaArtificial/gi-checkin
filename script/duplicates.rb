ENV['RAILS_ENV'] = 'production'
ticketConferences = TicketConference.all
ids_list = ticketConferences.pluck(:ticket_id)
ids_list.uniq!

TicketConference.exists?(:conference_id => randomRef, :ticket_id => ticket, :TicketConference_assistance => true))
