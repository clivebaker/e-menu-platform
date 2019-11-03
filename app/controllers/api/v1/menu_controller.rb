module Api
	module V1
		class MenuController < ApiController 
      def index
        restaurant = Restaurant.find(params[:id])
        ret = Menu.arrange_serializable
        ret = ret.select{|r| r['restaurant_id']==restaurant.id}
        render json: ret
      end
    end  
	end
end

