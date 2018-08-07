class AddRolesToResturantUsers < ActiveRecord::Migration[5.2]
  def change

		add_column :resturant_users, :roles, :string, array: true

  end
end
