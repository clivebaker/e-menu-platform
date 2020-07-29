class AddClonedFromToCustomLists < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_lists, :cloned_from, :integer
  end
end
