class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|
      t.string :name
      t.string :image
      t.string :flag
      t.text :description

      t.timestamps
    end
  end
end
