class AddStripeToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :stripe_api_key, :string
    add_column :restaurants, :stripe_publish_api_key, :string
  end
end
