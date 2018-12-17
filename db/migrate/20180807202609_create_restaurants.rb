# frozen_string_literal: true

class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :telephone
      t.string :email
      t.string :twitter
      t.string :facebook
      t.jsonb :opening_times, default: {}
      t.boolean :is_chain
      t.references :cuisine, foreign_key: true

      t.timestamps
    end
  end
end
