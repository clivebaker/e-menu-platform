class CreateItemScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :item_screens do |t|
      t.references :item_screen_type, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.references :printer, foreign_key: true
      t.boolean :on_new

      t.timestamps
    end
  end
end
