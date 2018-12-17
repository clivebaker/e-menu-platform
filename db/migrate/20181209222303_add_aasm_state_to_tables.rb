# frozen_string_literal: true

class AddAasmStateToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :aasm_state, :string
  end
end
