json.extract! transaction, :id, :transaction_type, :amount, :description, :category, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
