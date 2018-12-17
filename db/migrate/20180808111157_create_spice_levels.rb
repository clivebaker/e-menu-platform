# frozen_string_literal: true

class CreateSpiceLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :spice_levels do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
