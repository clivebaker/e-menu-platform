class CreateTableItems < ActiveRecord::Migration[5.2]
  def change
    create_table :table_items do |t|
      t.references :table, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
