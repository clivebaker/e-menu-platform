class AddPathToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :path, :string
  end
end
