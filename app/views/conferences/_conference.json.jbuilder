json.extract! conference, :id, :cnf_name, :cnf_ticketNumber, :cnf_capacity, :cnf_occupancy, :cnf_location, :created_at, :updated_at
json.url conference_url(conference, format: :json)
