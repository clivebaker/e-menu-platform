class SetDefaultSecondary < ActiveRecord::Migration[6.0]
  def change
    change_column :screen_items, :secondary, :boolean, default: false
  end
end
