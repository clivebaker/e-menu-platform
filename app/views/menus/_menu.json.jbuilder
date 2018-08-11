json.extract! menu, :id, :restaurant_id, :menu_id, :name, :description, :image, :spice_levels_id, :menu_item_categorisations_id, :prices, :available, :calories, :created_at, :updated_at
json.url menu_url(menu, format: :json)
