module Api
	module V1
		class MenuController < ApiController 
      def index
        restaurant = Restaurant.find(params[:id])
        render json: menu_json(restaurant.id)
      end

    def menu_json restaurant_id
      Rails.cache.fetch("api/restaurant/#{restaurant_id}/menu", expires_in: 30.minutes) do
        return_json(restaurant_id)
      end
    end


    def  return_json restaurant_id
      ret3 = Menu.arrange_serializable do |parent, children|
        url = url_for(parent.image) if parent.image.attached?
        {
          id: parent.id,
          restaurant_id: parent.restaurant_id,
          spice_level_id: parent.spice_level_id,
          menu_item_categorisation_id: parent.menu_item_categorisation_id,
          prices: parent.prices,
          available: parent.available,
          calories: parent.calories,
          ancestry:parent.ancestry,
          node_type: parent.node_type,
          price_a: parent.price_a,
          price_b: parent.price_b,
          nutrition: parent.nutrition,
          provenance: parent.provenance,
          custom_lists: custom_list(parent.custom_lists),
          position: parent.position,
          name: parent.name,
          image: url,
          description: parent.description,
          children: children
        }
      end
      # binding.pry

      ret3 = ret3.select{|r| r[:restaurant_id]==restaurant_id}

    end




      def custom_list(lists)
        ret = []
        lists.keys.each do |key|
          list = CustomList.find(key)
          items = []
          lists[key].each do |item|
            list_item = CustomListItem.find(item)
            items << {name: list_item.name, id: list_item.id}
          end

          # CustomList
          # CustomListItem
          ret << {name: list.name , custom_list_id: list.id, constraint: list.constraint, items: items }

        end

        ret




      end

    end  
	end
end

