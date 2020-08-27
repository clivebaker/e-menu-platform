class CreateRaspberryPiUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :raspberry_pi_updates do |t|
      t.string :version
      t.text :payload

      t.timestamps
    end
  end
end
