# frozen_string_literal: true

class RemoveTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :tables
  end
end
