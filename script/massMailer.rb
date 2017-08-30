ENV['RAILS_ENV'] = 'production'
tickets = Ticket.where(:ticket_preregistered => true)
tickets.each do |ticket|
  puts ticket.ticket_email
  UserMailer.welcome_email(ticket).deliver_now
end
