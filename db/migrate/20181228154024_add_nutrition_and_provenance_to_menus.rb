class AddNutritionAndProvenanceToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :nutrition, :text
    add_column :menus, :provenance, :text
  end
end
