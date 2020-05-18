class AddStylesToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :custom_styles, :text
  end
end
