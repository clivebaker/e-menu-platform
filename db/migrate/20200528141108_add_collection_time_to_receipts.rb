class AddCollectionTimeToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :collection_time, :string
  end
end
