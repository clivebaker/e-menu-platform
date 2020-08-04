class RenamePrinters < ActiveRecord::Migration[5.2]
  def change

    rename_table :manager_printers, :printers
  end
end
