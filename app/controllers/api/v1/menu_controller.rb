module Api
	module V1
	 
		class MenuController < ApiController 




			def index	
				@table = Table.find(params[:id])



				render json: {
					table: @table,
					restaurant: @table.restaurant,
					menu: @table.restaurant.menus,
				}

			end



		end

	end
end