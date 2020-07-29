class AddClonedFromToCustomListItems < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_list_items, :cloned_from, :integer
  end
end
