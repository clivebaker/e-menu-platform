# frozen_string_literal: true

class CreateRestaurantTables < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_tables do |t|
      t.integer :number
      t.references :restaurant, foreign_key: true
      t.string :code
      t.string :aasm_state

      t.timestamps
    end
  end
end
