# frozen_string_literal: true

json.extract! restaurant_table, :id, :number, :restaurant_id, :code, :created_at, :updated_at
json.url restaurant_table_url(restaurant_table, format: :json)
