class AddUuidToScreenItems < ActiveRecord::Migration[5.2]
  def change
    add_column :screen_items, :uuid, :string
  end
end
