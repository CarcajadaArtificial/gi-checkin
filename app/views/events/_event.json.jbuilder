json.extract! event, :id, :event_name, :event_startDate, :event_endDate, :event_capacity, :event_attendance, :event_description, :event_onlyStudents, :created_at, :updated_at
json.url event_url(event, format: :json)
