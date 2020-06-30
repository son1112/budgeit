json.extract! message, :id, :from, :body, :conversation_id, :created_at, :updated_at
json.url message_url(message, format: :json)
