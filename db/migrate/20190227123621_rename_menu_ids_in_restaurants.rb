class RenameMenuIdsInRestaurants < ActiveRecord::Migration[5.2]
  def change

  	rename_column :restaurants, :menu_ids, :active_menu_ids

  end
end
