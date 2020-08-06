# frozen_string_literal: true

module Manager
  class LiveController < Manager::BaseController
    before_action :authenticate_manager_restaurant_user!, except: [:index]
    before_action :set_restaurant, except: [:send_receipt, :orders_broadcast]
    before_action :set_item_screens, except: [:send_receipt, :orders_broadcast]
    
    def tables
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
    end
    def items
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
      
    end
    def order
      
    end
    def orders
      @printers = Printer.where(restaurant_id: @restaurant.id)
    end
    def food
      @printers = Printer.where(restaurant_id: @restaurant.id)
    end
    def drinks
      @printers = Printer.where(restaurant_id: @restaurant.id)
    end
    

    def service
      @table_item = TableItem.find(params[:table_item_id])
      @table_item.service
      @table_item.save
      respond_to do |format|
          format.html { redirect_to manager_live_items_path(@restaurant.id), notice: 'Item successfully moved to service.' }
      end
    end
    def ready
      @table_item = TableItem.find(params[:table_item_id])
      @table_item.finish!

      respond_to do |format|
          format.html { redirect_to manager_live_items_path(@restaurant.id), notice: 'Item successfully finished.' }
      end
    end



    def send_receipt
        @receipt = Receipt.find(params[:receipt_id])
        @receipt.email_receipt
        respond_to do |format|
          format.html { redirect_to manager_receipts_path(@receipt.restaurant.id), notice: 'Receipt Sent.' }
        end
    end

    def receipts

      @printers = Printer.where(restaurant_id: @restaurant.id)
      @restaurant = Restaurant.find(params[:restaurant_id])
      @receipts = @restaurant.receipts.page params[:page]
    end

    def orders_broadcast
      Receipt.last.broadcast
    end

    def set_item_screens

      @item_screens = ItemScreen.where(restaurant_id: @restaurant.id)
    end

  end
end
