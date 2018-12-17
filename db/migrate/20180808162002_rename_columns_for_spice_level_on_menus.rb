class RenameColumnsForSpiceLevelOnMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :menus, :menu_item_categorisations_id, :menu_item_categorisation_id
    rename_column :menus, :spice_levels_id, :spice_level_id
  end
end
