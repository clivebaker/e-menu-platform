class CreateDailyReportings < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_reportings do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.jsonb :data
      t.date :date
      t.integer :total
      t.integer :items_count

      t.timestamps
    end
  end
end
