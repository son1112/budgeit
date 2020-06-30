json.extract! account, :id, :account_type, :name, :current_balance, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
