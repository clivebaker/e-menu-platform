class AddSourceToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :source, :string
  end
end
