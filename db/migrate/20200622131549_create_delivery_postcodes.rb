class CreateDeliveryPostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_postcodes do |t|
      t.string :prefix
      t.integer :delivery_fee
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
