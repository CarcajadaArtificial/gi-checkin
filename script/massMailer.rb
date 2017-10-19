ENV['RAILS_ENV'] = 'production'
# Sends Ticket to all preregistered emails of a particular event
#tickets = Ticket.where(:ticket_preregistered => true, :event_id =>1)
#tickets.each do |ticket|
#  puts ticket.ticket_email
#  TicketMailer.preregister_email(ticket).deliver_now
#end

# Sends Tickets to all preregistered emails of a particular event updated in a specific date range
#tickets = Ticket.where(:updated_at => '2017-08-31'..'2017-09-12', :event_id => 1)
#tickets.each do |ticket|
#  puts ticket.ticket_email
#  TicketMailer.preregister_email(ticket).deliver_now
#end

# Sends Reminder to all preregistered emails of a particular event
tickets = Ticket.where(:ticket_preregistered => true, :ticket_badgeNumber => nil, :event_id =>1).last(29)
tickets.each do |ticket|
  puts ticket.ticket_email
  TicketMailer.reminder_email(ticket).deliver_now
  ticket.ticket_badgeNumber = 1
  ticket.save
end
