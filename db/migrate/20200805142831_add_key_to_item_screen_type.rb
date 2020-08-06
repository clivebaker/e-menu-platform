class AddKeyToItemScreenType < ActiveRecord::Migration[5.2]
  def change
    add_column :item_screen_types, :key, :string
  
  
  
    ist = ItemScreenType.find_or_create_by(name: "Full Receipt") 
    ist.key = 'FULL'
    ist.save
    ist = ItemScreenType.find_or_create_by(name: "Food")
    ist.key = 'FOOD'
    ist.save
    ist = ItemScreenType.find_or_create_by(name: "Drink")
    ist.key = 'DRINK'
    ist.save
  
  
  end



end
