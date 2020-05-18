class AddCssClassToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :css_class, :string
  end
end
