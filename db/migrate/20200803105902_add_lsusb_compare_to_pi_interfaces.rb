class AddLsusbCompareToPiInterfaces < ActiveRecord::Migration[5.2]
  def change
    add_column :pi_interfaces, :lsusb_compare, :text
  end
end
