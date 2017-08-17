json.extract! conference, :id, :conference_name, :conference_date, :conference_capacity, :conference_attendance, :conference_description, :conference_speaker, :conference_location, :created_at, :updated_at
json.url conference_url(conference, format: :json)
