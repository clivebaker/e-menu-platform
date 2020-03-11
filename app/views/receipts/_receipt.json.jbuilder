json.extract! receipt, :id, :uuid, :restaurant_id, :basket_total, :items, :email, :stripe_token, :status, :is_ready, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
