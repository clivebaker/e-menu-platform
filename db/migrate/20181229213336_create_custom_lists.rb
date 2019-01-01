class CreateCustomLists < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_lists do |t|
      t.string :name
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
