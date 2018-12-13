class AddForToTableItems < ActiveRecord::Migration[5.2]
  def change
    add_column :table_items, :for, :string
  end
end
