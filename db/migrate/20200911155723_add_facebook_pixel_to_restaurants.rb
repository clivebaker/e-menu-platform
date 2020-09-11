class AddFacebookPixelToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :facebook_pixel, :string
  end
end
