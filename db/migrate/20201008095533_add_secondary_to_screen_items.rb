class AddSecondaryToScreenItems < ActiveRecord::Migration[6.0]
  def change
    add_column :screen_items, :secondary, :boolean
  end
end
