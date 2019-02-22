# frozen_string_literal: true

module Manager
  class LiveController < Manager::BaseController
    before_action :authenticate_manager_restaurant_user!, except: [:index]
    before_action :set_restaurant
    
    def tables
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
    end
    def items
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
    end

    def service
      @table_item = TableItem.find(params[:table_item_id])
      @table_item.service
      @table_item.save
      respond_to do |format|
          format.html { redirect_to manager_live_items_path(@restaurant.id), notice: 'Item successfully moved to service.' }
      end

    end



  end
end