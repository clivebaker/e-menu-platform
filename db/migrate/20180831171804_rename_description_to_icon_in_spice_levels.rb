class RenameDescriptionToIconInSpiceLevels < ActiveRecord::Migration[5.2]
  def change


  		rename_column :spice_levels, :description, :icon


  end
end
