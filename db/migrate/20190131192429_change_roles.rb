class ChangeRoles < ActiveRecord::Migration[5.2]
  def change

  	change_column :restaurant_users, :roles, :text, array: true, default: []


  end
end
