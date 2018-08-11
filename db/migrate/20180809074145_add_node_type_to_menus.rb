class AddNodeTypeToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :node_type, :string
  end
end
