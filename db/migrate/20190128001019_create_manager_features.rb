class CreateManagerFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
