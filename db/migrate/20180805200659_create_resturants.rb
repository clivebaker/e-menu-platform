class CreateResturants < ActiveRecord::Migration[5.2]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.boolean :is_chain
      t.references :cuisine, foreign_key: true

      t.timestamps
    end
  end
end
