class AddDeliveryFeeAndTableNumberToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :delivery_fee, :decimal, precision: 8, scale: 2
    add_column :receipts, :table_number, :string
  end
end
