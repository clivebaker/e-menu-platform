class AddPositionToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :position, :integer
  end
end
