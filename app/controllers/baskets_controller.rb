class BasketsController < ApplicationController

  before_action :set_path_and_restaurant

  def update
    basket_service = BasketService.new(@restaurant, cookies['emenu_basket'])

    action = basket_service.apply_discount_code(params[:discount_code]) if params[:discount_code]

    respond_to do |format|
      if action
        format.html { redirect_to restaurant_path_path(@path) } 
      else
        format.html { redirect_to restaurant_path_path(@path), alert: "Error!" }
      end
    end   
  end

  private

  def set_path_and_restaurant
    @menu_id = params[:menu_id]
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
  end
end
