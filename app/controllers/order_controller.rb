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

    
    t = Time.new + 30.minutes
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


end


def stripe
  @path = params[:path]
  @name = params[:name]
  @collection_time = params[:collection_time]
  @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    if @basket
      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  @basket['items'].map{|d| d['total']}.inject(:+)
    end
 

    puts "****************************************************************"
    puts "****************************************************************"
    puts "****************************************************************"

    puts items = @basket['ids']

    puts "****************************************************************"
    puts "****************************************************************"
    puts "****************************************************************"

    Stripe.api_key = @restaurant.stripe_api_key

    token = params[:token]
    price = params[:price].to_i

    Rails.logger.debug("Payment Token: #{token}")
    Rails.logger.debug("Payment Price: #{price}")
    begin
      puts "*************** AA"
     @status = Stripe::Charge.create(
        amount: price,
        currency: 'gbp',
        description: "#{@path} charge",
        source: token
      )
      
      puts "*************** BB"

    cookies.delete :basket
 
    puts "*************** CC"
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
      source: :takeaway
    )
    puts "*************** DD"
    rescue Exception => e
      error = e
      puts "*************** EE: #{e}"
    puts e
  end

    

  puts "****************************************************************"
  puts "status: #{@status.inspect} ***********************************"
  puts "****************************************************************"


  

  puts "****************************************************************"
  puts "RECEIPT: #{@receipt.inspect} ***********************************"
  puts "****************************************************************"


  puts "****************************************************************"
  puts "ERROR: #{error} ************************************************"
  puts "****************************************************************"



  respond_to do |format|
    if error.present?
      format.html { redirect_to order_receipt_path(@path, @receipt.uuid), alert: "Payment Error: #{e.message}" } 
      format.json { render json: {ok: true, error: false, path: order_receipt_path(@path, @receipt.uuid)} }
    else
      format.html { redirect_to order_receipt_path(@path, @receipt.uuid), notice: "Payment Successful" }
      format.json { render json: {ok: true, error: true, path: order_receipt_path(@path, @receipt.uuid)} }
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
      #@restaurants = Restaurant.all if @restaurant.blank?

      if cookies[:basket]
        @basket = JSON.parse(cookies[:basket])
        @basket_item_count = @basket['count']
        @basket_item_total = @basket['items'].map{|d| d['total']}.inject(:+)
      end

    end
  
    def add_to_basket


      path = params[:path]

      @basket = JSON.parse(cookies[:basket]) if cookies[:basket]
      basket_items = @basket.present? ? @basket['items'] : []
      basket_ids =  @basket.present? ? @basket['ids'] : []

      main_item = params[:main_item]
      items = params[:items].split(',') if params[:items].present?
      
      menu_item = Menu.find(main_item)
      optionals = CustomListItem.where(id: items)
   
     

      total = ("%.2f" % menu_item.price_a).to_f
      total += optionals.map{|s| ("%.2f" % s.price).to_f }.inject(:+) if optionals.present?
      uuid = SecureRandom.uuid
      basket_items << {uuid: uuid, total: total ,item: menu_item.name , optionals: optionals.map{|s| s.name} }
      basket_ids << {uuid: uuid, total: total,item: menu_item.id, optionals: optionals.map{|s| s.id }}

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
   