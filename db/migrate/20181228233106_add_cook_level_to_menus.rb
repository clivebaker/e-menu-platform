class AddCookLevelToMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :cook_level, foreign_key: true
  end
end
