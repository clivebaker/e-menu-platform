class AddCustomListsToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :custom_lists, :jsonb, default: {}
  end
end
