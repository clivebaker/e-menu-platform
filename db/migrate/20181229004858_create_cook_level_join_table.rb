class CreateCookLevelJoinTable < ActiveRecord::Migration[5.2]
  def change

    create_join_table :menus, :cook_levels do |t|
      # t.index [:menu_id, :menu_item_categorisation_id]
      # t.index [:menu_item_categorisation_id, :menu_id]
    end


  end
end
