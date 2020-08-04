class AddOnlineToPiInterfaces < ActiveRecord::Migration[5.2]
  def change
    add_column :pi_interfaces, :online, :boolean
  end
end
