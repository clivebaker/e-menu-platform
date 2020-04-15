class CreateManagerSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_settings do |t|
      t.string :name
      t.string :key
      t.string :category

      t.timestamps
    end
  end
end
