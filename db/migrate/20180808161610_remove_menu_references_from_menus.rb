# frozen_string_literal: true

class RemoveMenuReferencesFromMenus < ActiveRecord::Migration[5.2]
  def change
    remove_index :menus, :menu_id
    remove_column :menus, :menu_id
  end
end
