class CreateCustomListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_list_items do |t|
      t.string :name
      t.references :custom_list, foreign_key: true
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
