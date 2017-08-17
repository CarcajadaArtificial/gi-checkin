json.extract! ticket, :id, :ticket_reference, :ticket_ticketTypeId, :ticket_name, :ticket_schoolId, :ticket_email, :ticket_sex, :ticket_age, :ticket_course, :ticket_semester, :ticket_other, :ticket_badgeNumber, :ticket_registered, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
