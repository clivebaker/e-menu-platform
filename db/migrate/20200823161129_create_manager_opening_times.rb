class CreateManagerOpeningTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_times do |t|
      t.references :restaurant, foreign_key: true
      t.jsonb :times, default: {}

      t.timestamps
    end
  end
end
