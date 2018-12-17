# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :locale
      t.string :icon

      t.timestamps
    end
  end
end
