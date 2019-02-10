class AddAasmStateToTableItems < ActiveRecord::Migration[5.2]
  def change
    add_column :table_items, :aasm_state, :string
  end
end
