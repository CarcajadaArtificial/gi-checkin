ENV['RAILS_ENV'] = 'production'
tickets = Ticket.where(:event_id => 4)
tickets.each do |ticket|
  ref= ticket.ticket_reference
  newRef = ref.chomp
  ticket.ticket_reference = newRef
  ticket.save
end
