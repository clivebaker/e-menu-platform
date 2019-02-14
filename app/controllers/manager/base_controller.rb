# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
  	  alias_method :current_user, :current_manager_restaurant_user # Could be :current_member or :logged_in_user
  	  
    layout 'manager'

  
    def set_restaurant
       @restaurant = Restaurant.find(params[:restaurant_id])
      unless current_manager_restaurant_user.id == @restaurant.restaurant_user_id
        redirect_to '/422.html'
      end
    end
  end

end



