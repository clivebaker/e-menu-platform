class AddRootNodeIdToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :root_node_id, :integer
  end
end
