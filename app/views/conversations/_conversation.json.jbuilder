json.extract! conversation, :id, :user_number, :service_number, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
