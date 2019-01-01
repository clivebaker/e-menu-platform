class RemoveCookLevelIds < ActiveRecord::Migration[5.2]
  def change

  	remove_column :menus, :cook_level_ids
  	
  end
end
