json.extract! event_user, :id, :Event_id, :User_id, :created_at, :updated_at
json.url event_user_url(event_user, format: :json)
