class AddCustomListsToTableItems < ActiveRecord::Migration[5.2]
  def change
    add_column :table_items, :custom_lists, :jsonb, default: {}
  end
end
