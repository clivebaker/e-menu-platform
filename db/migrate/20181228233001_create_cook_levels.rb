class CreateCookLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
