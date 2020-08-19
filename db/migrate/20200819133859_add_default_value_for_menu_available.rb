class AddDefaultValueForMenuAvailable < ActiveRecord::Migration[5.2]
  def change

    change_column :menus, :available, :boolean, default: true
  end
end
