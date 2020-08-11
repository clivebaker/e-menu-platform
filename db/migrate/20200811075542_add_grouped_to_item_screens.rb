class AddGroupedToItemScreens < ActiveRecord::Migration[5.2]
  def change
    add_column :item_screens, :grouped, :boolean, default: true
  end
end
