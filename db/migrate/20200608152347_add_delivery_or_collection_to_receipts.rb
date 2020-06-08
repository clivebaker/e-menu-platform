class AddDeliveryOrCollectionToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :delivery_or_collection, :string
  end
end
