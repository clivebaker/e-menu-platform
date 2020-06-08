class AddPositionToCustomList < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_lists, :position, :integer
  end
end
