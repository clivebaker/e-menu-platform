class AddNumberSeatsToRestaurantTables < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_tables, :number_seats, :integer
  end
end
