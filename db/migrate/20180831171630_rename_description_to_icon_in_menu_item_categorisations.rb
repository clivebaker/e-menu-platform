class RenameDescriptionToIconInMenuItemCategorisations < ActiveRecord::Migration[5.2]
  def change


		rename_column :menu_item_categorisations, :description, :icon

  end
end
