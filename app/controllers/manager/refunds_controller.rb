module Manager
  class RefundsController < ApplicationController
    before_action :authenticate_manager_restaurant_user!

    def create
      @order = Order.where(:restaurant_id => params[:restaurant_id], :id => params[:id]).first
      respond_to do |format|
        if OrderService.new(@order).refund
          format.html { redirect_to manager_live_orders_path(@order.restaurant), notice: "Success", status: 200 } 
        else
          format.html { redirect_to manager_live_orders_path(@order.restaurant), notice: "Failure", status: 500 }
        end
      end
    end
  end
end
