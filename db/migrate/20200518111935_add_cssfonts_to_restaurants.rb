class AddCssfontsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :css_font_url, :string
    add_column :restaurants, :css_font_class, :string
  end
end
