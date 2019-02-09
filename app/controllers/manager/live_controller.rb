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

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end


  end
end
