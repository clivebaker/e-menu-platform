# frozen_string_literal: true

class CreateMenuItemCategorisations < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_item_categorisations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
