json.extract! message, :id, :room_id, :user_id, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
