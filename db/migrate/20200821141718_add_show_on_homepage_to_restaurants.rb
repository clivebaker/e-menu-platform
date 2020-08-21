class AddShowOnHomepageToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :show_on_homepage, :boolean
  end
end
