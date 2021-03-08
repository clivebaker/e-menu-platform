module Manager
  class RefundsController < ApplicationController
    before_action :authenticate_manager_restaurant_user!

    def create
      @order = Order.where(:restaurant_id => params[:restaurant_id], :id => params[:id]).first
      os = OrderService.new(@order).refund
      if os == true
        redirect_to manager_live_orders_path(@order.restaurant), notice: "Success"
      else
        redirect_to manager_live_orders_path(@order.restaurant), notice: "Failure: #{os}"
      end
    end
  end
end
