class CreateJoinTableFeaturesRestaurants < ActiveRecord::Migration[5.2]
  def change

  	create_join_table :restaurants, :features

  end
end
