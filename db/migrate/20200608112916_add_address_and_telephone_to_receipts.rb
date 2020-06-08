class AddAddressAndTelephoneToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :telephone, :string
    add_column :receipts, :address, :string
  end
end
