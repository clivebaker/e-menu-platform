class CreatePiInterfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :pi_interfaces do |t|
      t.string :server_token
      t.references :restaurant

      t.timestamps
    end
  end
end
