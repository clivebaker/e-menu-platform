class AddIsDeletedToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :is_deleted, :boolean, default: false
  end
end
