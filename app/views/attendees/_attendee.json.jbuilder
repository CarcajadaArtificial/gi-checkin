json.extract! attendee, :id, :att_name, :att_idNumber, :att_course, :att_ticketNumber, :att_semester, :att_registered, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
