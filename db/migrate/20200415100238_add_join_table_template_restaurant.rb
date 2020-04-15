class AddJoinTableTemplateRestaurant < ActiveRecord::Migration[5.2]
  def change

    create_join_table :restaurants, :templates

  end
end
