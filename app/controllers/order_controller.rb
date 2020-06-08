class OrderController < ApplicationController
  before_action :authenticate_user!, except: [:index, :add_to_basket, :stripe,:stripex, :receipt, :basket, :checkout,:checkoutx, :remove_from_basket]
  skip_before_action :verify_authenticity_token, only: %i[stripe stripex]
  def remove_from_basket
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    if @basket
      @basket = JSON.parse(@basket)
      basket_items = @basket['items'].reject{|a| a['uuid'] == params[:uuid]}
      basket_ids = @basket['ids'].reject{|a| a['uuid'] == params[:uuid]}
      cookies[:basket] = {
        restaurant: @path,
        count: basket_ids.count,
        items: basket_items,
        ids: basket_ids 
      }.to_json
    end
    respond_to do |format|
      format.html { redirect_to restaurant_path_path(@path), notice: 'Removed from basket' }
    end
  end

  def basket
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    if @basket

      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  @basket['items'].map{|d| d['total']}.inject(:+)
    end
  end


  def checkout
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    delay_time_minutes = @restaurant.delay_time_minutes
    delay_time_minutes = 30 if delay_time_minutes.blank? 
    
    t = Time.new.in_time_zone('Europe/London') + delay_time_minutes.minutes
    rounded_t = Time.local(t.year, t.month, t.day, t.hour, t.min/15*15)
    @delivery_time_options = ["ASAP"]
    until rounded_t > Time.local(t.year, t.month, t.day, 22, 00)
      @delivery_time_options << rounded_t.strftime("%H:%M")
      rounded_t = rounded_t + 30.minutes
    end

    if @basket
      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  (@basket['items'].map{|d| d['total']}.inject(:+)*100.to_f).to_i
    end
    # @publish_stripe_api_key = ENV['PUBLISH_STRIPE_API_KEY'] || Rails.application.credentials.dig(:stripe, :publish_api_key) 
    @publish_stripe_api_key = @restaurant.stripe_publish_api_key
    @google_maps_api_key = Rails.application.credentials.dig(:google, :maps_api_key) 


end


def stripe


  puts "****************************************************************"
  puts "PARAMS: #{params.inspect}"
  puts "****************************************************************"



  @address = params[:address]
  @telephone = params[:telephone]
  
  error = false
  @path = params[:path]
  @name = params[:name]
  @delivery_or_collection = params[:type]
  @collection_time = params[:collection_time]
  @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    if @basket
      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  @basket['items'].map{|d| d['total']}.inject(:+)
    end
 
    items = @basket['ids']

    Stripe.api_key = @restaurant.stripe_api_key

    token = params[:token]
    price = params[:price].to_i

    Rails.logger.debug("Payment Token: #{token}")
    Rails.logger.debug("Payment Price: #{price}")
    begin
     @status = Stripe::Charge.create(
        amount: price,
        currency: 'gbp',
        description: "#{@path} charge",
        source: token
      )
      
    @receipt =  Receipt.create(
      uuid: SecureRandom.uuid,
      restaurant_id: @restaurant.id,
      basket_total: price,
      items: @basket,
      #email: '',
      name: @name,
      collection_time: @collection_time,
      stripe_token: token,
      status: @status,
      is_ready: false,
      source: :takeaway, 
      telephone: @telephone,
      address: @address,
      delivery_or_collection: @delivery_or_collection
    )
    rescue Exception => e
      error = true
    puts e
  end

    
  unless error

   cookies.delete :basket
 
  end

  

  puts "****************************************************************"
  puts "RECEIPT: #{@receipt.inspect} ***********************************"
  puts "****************************************************************"




  respond_to do |format|
    if error
      format.html { redirect_to order_receipt_path(@path, @receipt.uuid), alert: "Payment Error: #{e.message}" } 
      format.json { render json: {ok: true, error: true, path: order_receipt_path(@path, @receipt.uuid)} }
    else
      format.html { redirect_to order_receipt_path(@path, @receipt.uuid), notice: "Payment Successful" }
      format.json { render json: {ok: true, error: false, path: order_receipt_path(@path, @receipt.uuid)} }
    end
  end


  end






  def stripex
    
    puts token = params[:token]
    puts price = params[:price].to_i
  
    respond_to do |format|
        format.json { render json: {ok: true, error: false, path: 'http://clivebaker.com'} }
    end
  
  
    end
  
  

  def receipt
    @path = params[:path]
    @uuid = params[:uuid]
    @restaurant = Restaurant.find_by(path: @path)
    @receipt = Receipt.find_by(uuid: @uuid)
  end

    def index

      @path = params[:path]
      @restaurant = Restaurant.find_by(path: @path)
      
      @menu =   @restaurant.menus
      
      
      @menu2 = get_serialized_menu(@restaurant)
      
      # @menu2 = @restaurant.menus.arrange_serializable(order: :position) do |parent, children|
      #   image = (parent.image if image.present?)  
      #   {
      #     id: parent.id,
      #     name: parent.name,
      #     node_type: parent.node_type,
      #     children: children,
      #     ancestry: parent.ancestry,
      #     css_class: parent.css_class,
      #     price_a: parent.price_a,
      #     image: image , 
      #     description: parent.description,
      #     custom_lists: parent.custom_lists,
      #     nutrition: parent.nutrition,
      #     provenance: parent.provenance, 
      #     calories: parent.calories
      #   }
      # end




      #@restaurants = Restaurant.all if @restaurant.blank?

      if cookies[:basket]
        @basket = JSON.parse(cookies[:basket])
        @basket_item_count = @basket['count']
        @basket_item_total = @basket['items'].map{|d| d['total']}.inject(:+)
      end

    end
  


    def get_serialized_menu restaurant
      Rails.cache.fetch("restaurant_order_menu_#{@restaurant.id}", expires_in: 3.hours) do
        @menu2 = @restaurant.menus.arrange_serializable(order: :position) do |parent, children|
          image = (parent.image if image.present?)  
          {
            id: parent.id,
            name: parent.name,
            node_type: parent.node_type,
            children: children,
            ancestry: parent.ancestry,
            css_class: parent.css_class,
            price_a: parent.price_a,
            image: image , 
            description: parent.description,
            custom_lists: parent.custom_lists,
            nutrition: parent.nutrition,
            provenance: parent.provenance, 
            calories: parent.calories
          }
        end
  
      end
    end




    def add_to_basket
      # my_logger ||= Logger.new("#{Rails.root}/log/basket.log")
      path = params[:path]

      @basket = JSON.parse(cookies[:basket]) if cookies[:basket]
      basket_items = @basket.present? ? @basket['items'] : []
      basket_ids =  @basket.present? ? @basket['ids'] : []

      main_item = params[:main_item]
      items = params[:items].split(',') if params[:items].present?
      
      menu_item = Menu.find(main_item)
      optionals = CustomListItem.where(id: items)
      @restaurant = menu_item.restaurant
      puts "#############################################################################"
      puts "#############################################################################"

      sort_order = @restaurant.custom_list_ids
      lookup = {}
      sort_order.each_with_index do |item, index|
        lookup[item] = index
      end

      cl = optionals.sort_by do |item|
        lookup.fetch(item.custom_list_id)
      end
      


      # puts optionals
      # my_logger.info("#############################################################################")
      # my_logger.info(optionals)
      # my_logger.info("#############################################################################")
      # my_logger.info(cl)
      # my_logger.info("#############################################################################")
     

      total = ("%.2f" % menu_item.price_a).to_f
      total += cl.map{|s| ("%.2f" % s.price).to_f }.inject(:+) if optionals.present?
      uuid = SecureRandom.uuid

    
      basket_items << {uuid: uuid, total: total ,item: "<i>#{menu_item.parent.name}</i> - <strong>#{menu_item.name}</strong>" , optionals: cl.map{|s| "<i>#{s.custom_list_name}</i> - <strong>#{s.name}</strong>" } }
      basket_ids << {uuid: uuid, total: total,item: menu_item.id, optionals: cl.map{|s| s.id }}

      cookies[:basket] = {
        restaurant: path,
        count: basket_ids.count,
        items: basket_items,
        ids: basket_ids 
    }.to_json

  
        respond_to do |format|
          format.html { redirect_to restaurant_path_path(path), notice: 'Added to basket' }
        end

    end
  
  
  end
   