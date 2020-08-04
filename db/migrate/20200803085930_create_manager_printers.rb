class CreateManagerPrinters < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_printers do |t|
      t.string :name
      t.references :pi_interface, foreign_key: true
      t.string :vendor
      t.string :product

      t.timestamps
    end
  end
end
