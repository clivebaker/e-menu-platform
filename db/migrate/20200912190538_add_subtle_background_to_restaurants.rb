class AddSubtleBackgroundToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :subtle_background, :string
  end
end
