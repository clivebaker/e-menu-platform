class CreateRaspberryPiStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :raspberry_pi_statuses do |t|
      t.boolean :state

      t.timestamps
    end

    RaspberryPiStatus.create(state: true)

  end
end
