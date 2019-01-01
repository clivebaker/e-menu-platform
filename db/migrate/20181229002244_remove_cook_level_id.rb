class RemoveCookLevelId < ActiveRecord::Migration[5.2]
  def change

  	remove_column :menus, :cook_level_id
  	add_column :menus, :cook_level_ids, :integer, array:true, default: []



  end
end
