class AddBuzzOnNewToItemScreens < ActiveRecord::Migration[5.2]
  def change
    add_column :item_screens, :buzz_on_new, :boolean
  end
end
