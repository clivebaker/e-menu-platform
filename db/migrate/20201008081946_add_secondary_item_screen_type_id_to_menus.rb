class AddSecondaryItemScreenTypeIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :secondary_item_screen_type_id, :integer
  end
end
