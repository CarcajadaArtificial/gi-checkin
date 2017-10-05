ENV['RAILS_ENV'] = 'development'
arrTicketConference = TicketConference.order(:ticket_id)

arrTicketConference.each_with_index do |c,i|
  if c.TicketConference_assistance
    TicketConference.where(:ticket_id => c.ticket_id, :conference_id => c.conference_id, :TicketConference_assistance => nil).delete_all
  elsif i < arrTicketConference.count
    if c.ticket_id == arrTicketConference[i+1].ticket_id
      c.delete
    end
  end
end
