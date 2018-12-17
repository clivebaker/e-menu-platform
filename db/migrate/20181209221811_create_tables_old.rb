# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :number
      t.references :restaurant, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
