class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.jsonb :contents, default: {}
      t.string :key

      t.timestamps
    end
  end
end
