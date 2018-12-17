# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.references :restaurant_table, foreign_key: true
      t.string :password
      t.string :aasm_state

      t.timestamps
    end
  end
end
