class AddPaidAndTokenToTableItems < ActiveRecord::Migration[5.2]
  def change
    add_column :table_items, :paid, :boolean
    add_column :table_items, :token, :string
  end
end
