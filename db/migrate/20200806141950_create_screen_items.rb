class CreateScreenItems < ActiveRecord::Migration[5.2]
  def change
    create_table :screen_items do |t|
      t.references :menu, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.boolean :ready, default: false
      t.references :receipt, foreign_key: true
      t.string :item_screen_type_key

      t.timestamps
    end
  end
end
