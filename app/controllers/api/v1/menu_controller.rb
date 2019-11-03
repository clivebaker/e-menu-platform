module Api
	module V1
		class MenuController < ApiController 
      def index
        @restaurant = Restaurant.find(params[:id])
        @menus = Menu.where(restaurant_id: @restaurant, ancestry: nil)
        @sorted_menus = Menu.sort_by_ancestry(@menus)
        ret = Menu.arrange_serializable
        ret = ret.select{|r| r['restaurant_id']==3}
        render json: ret
      end
    end  
	end
end

