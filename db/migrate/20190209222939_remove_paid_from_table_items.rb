class RemovePaidFromTableItems < ActiveRecord::Migration[5.2]
  def change


  	remove_column :table_items, :paid

  end
end
