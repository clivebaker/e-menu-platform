class AddOptionsToCustomLists < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_lists, :constraint, :string
  end
end
