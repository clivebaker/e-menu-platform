class AddLsusbToPiInterfaces < ActiveRecord::Migration[5.2]
  def change
    add_column :pi_interfaces, :lsusb, :text
  end
end
