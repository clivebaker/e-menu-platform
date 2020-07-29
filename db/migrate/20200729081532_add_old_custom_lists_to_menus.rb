class AddOldCustomListsToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :old_custom_lists, :jsonb
  end
end
