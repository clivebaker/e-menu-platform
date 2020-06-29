class ChangeColumnToDecimalOnDeliveryPostcodes < ActiveRecord::Migration[5.2]
  def change


    remove_column :delivery_postcodes, :delivery_fee
    add_column :delivery_postcodes, :delivery_fee, :decimal, precision: 5, scale: 2
    


  end
end
