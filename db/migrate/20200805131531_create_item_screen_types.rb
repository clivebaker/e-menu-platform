class CreateItemScreenTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_screen_types do |t|
      t.string :name

      t.timestamps
    end

    ItemScreenType.create(name: "Full Receipt")
    ItemScreenType.create(name: "Food")
    ItemScreenType.create(name: "Drink")
    

  end
end
