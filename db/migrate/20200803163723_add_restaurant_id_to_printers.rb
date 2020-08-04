class AddRestaurantIdToPrinters < ActiveRecord::Migration[5.2]
  def change
    add_reference :printers, :restaurant, foreign_key: true
  end
end
