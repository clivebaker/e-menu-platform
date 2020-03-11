class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :uuid
      t.references :restaurant, foreign_key: true
      t.integer :basket_total
      t.jsonb :items
      t.string :email
      t.string :stripe_token
      t.string :status
      t.boolean :is_ready

      t.timestamps
    end
  end
end
