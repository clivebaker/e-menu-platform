class AddItemScreenTypeIdToMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :item_screen_type, foreign_key: true
  end
end
