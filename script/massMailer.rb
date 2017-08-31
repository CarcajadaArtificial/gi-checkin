ENV['RAILS_ENV'] = 'production'
tickets = Ticket.where(:ticket_preregistered => true)
tickets.each do |ticket|
  puts ticket.ticket_email
  TicketMailer.preregister_email(ticket).deliver_now
end
