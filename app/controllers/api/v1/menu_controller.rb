module Api
	module V1
	 
		class MenuController < ApiController 




			def index	
				@table = Table.find(params[:id])
				@menus = Menu.where(restaurant_id: @table.restaurant)

				menu = {}


# Menu.sort_by_ancestry(@menus).each do |category|
#     menu[:title] = category.name
#     #link_to "Add Category to #{category.name}", new_manager_restaurant_menu_path(category.restaurant_id,  node_type: 'section',parent: category.id), class: "text-warning  menu-management-links" | 
#     #link_to "New Item in #{category.name}", new_manager_restaurant_menu_path(category.restaurant_id, node_type: 'item', parent: category.id), class: "text-warning menu-management-links"  
#     #link_to edit_manager_restaurant_menu_path(category.restaurant_id, category.id, node_type: category.node_type, parent: category.id), class: "text-warning menu-management-links" do<i class='fa fa-edit'></i> Editend | 
#     #link_to manager_restaurant_menu_path(category.restaurant_id, category.id), class: "text-warning menu-management-links", method: :delete,  "data-confirm" => 'Are you sure? This will remove all items and categories!' do<i class='fa fa-trash'></i> Deleteend
#     if category.children.present?
#           submenu(menu, category, @table) 
#     end
# end



			ret = 	@menus.arrange_serializable do |parent, children|
				  			MenuSerializer.new(parent, children: children)
							end


				render json: ret

				#  {
				# 	table: @table,
				# 	restaurant: @table.restaurant,
				# 	menu: @menus #.arrange_serializable,
				# }

			end







def submenu(menu, category, table)



#<ul class="management-menu">
   category.children.each do |sub| 

   
        if sub.node_type != 'item'
            menu[sub.name] = {} 
        end
          if sub.node_type != "item"
#            link_to "Add Category to #{sub.name}", new_manager_restaurant_menu_path(sub.restaurant_id,  node_type: 'section', parent: sub.id), class: "text-warning  menu-management-links" | 
#            link_to "New Item in #{sub.name}", new_manager_restaurant_menu_path(sub.restaurant_id, node_type: 'item', parent: sub.id), class: "text-warning menu-management-links"  
#            link_to edit_manager_restaurant_menu_path(sub.restaurant_id, sub.id, node_type: sub.node_type, parent: sub.id), class: "text-warning menu-management-links" do<i class='fa fa-edit'></i> Editend | 
#            link_to manager_restaurant_menu_path(sub.restaurant_id, sub.id), class: "text-warning menu-management-links", method: :delete,  "data-confirm" => 'Are you sure? This will remove all items and categories!' do<i class='fa fa-trash'></i> Deleteend
          else
#            link_to manager_restaurant_menu_path(sub.restaurant_id, sub.id, updated_menu: sub.id), class: " menu-management-links" do<i class='fa fa-info-circle'></i> Viewend | 
#            link_to edit_manager_restaurant_menu_path(sub.restaurant_id, sub.id, node_type: sub.node_type, updated_menu: sub.id), class: " menu-management-links" do<i class='fa fa-edit'></i> Editend | 
#            link_to manager_restaurant_menu_path(sub.restaurant_id, sub.id), method: :delete, class: " menu-management-links", "data-confirm" => 'Are you sure? This will remove all items and categories!' do<i class='fa fa-trash'></i> Deleteend
          end     





if sub.node_type == 'item'

            menu[sub.name] = sub.name

          if sub.image.attached?
            sub.image.variant(resize: "50x50") 
          end
          sub.description
          sub.available

          sub.menu_item_categorisation.each do |category|
            category.icon
          end
   #       "Custom List" if sub.custom_lists.present?

             sub.prices_joined.map{|a| a}.join(" / ") if sub.prices_joined
      end
      

      submenu(menu, sub, table) 
  end

end



		end

	end
end

