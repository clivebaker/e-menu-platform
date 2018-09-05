class AddPriceAAndPriceBToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :price_a, :decimal, precision: 6, scale: 2
    add_column :menus, :price_b, :decimal, precision: 6, scale: 2
  end
end
