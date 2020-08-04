class AddPrintTypeToPrinters < ActiveRecord::Migration[5.2]
  def change
    add_column :printers, :print_type, :string
  end
end
