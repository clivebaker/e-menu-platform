class AddActiveMenusToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :menu_ids, :integer, array: true, default: []
  end
end
