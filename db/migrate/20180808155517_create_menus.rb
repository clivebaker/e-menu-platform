class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :restaurant, foreign_key: true
      t.references :menu, foreign_key: true
      t.string :name
      t.text :description
      t.string :image
      t.references :spice_levels, foreign_key: true
      t.references :menu_item_categorisations, foreign_key: true
      t.jsonb :prices, array: true
      t.boolean :available
      t.integer :calories

      t.timestamps
    end
  end
end
