class AddCssToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :custom_css, :text
  end
end
