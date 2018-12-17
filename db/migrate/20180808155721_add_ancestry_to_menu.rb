# frozen_string_literal: true

class AddAncestryToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :ancestry, :string
    add_index :menus, :ancestry
  end
end
