class OrderController < ApplicationController
  before_action :authenticate_user!, except: [:pay, :index, :add_to_basket, :stripe,:stripex, :receipt, :basket, :checkout,:checkoutx, :remove_from_basket]
  skip_before_action :verify_authenticity_token, only: %i[stripe stripex]

  def index
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
    @menu = @restaurant.menus_live_menus
    @menu2 = get_serialized_menu(@restaurant)
    
    basket_service = BasketService.new(@restaurant, cookies['emenu_basket'])

    if basket_service.get_basket_db&.contents.present?
      @basket = basket_service.get_basket
      @basket_item_count = basket_service.get_basket_item_count
      @basket_item_total = basket_service.get_basket_item_total
    else
      cookies['emenu_basket'] = basket_service.get_basket
    end
  end

  def add_to_basket
    # my_logger ||= Logger.new("#{Rails.root}/log/basket.log")
    # binding.pry
    path = params[:path]
    @restaurant = Restaurant.find_by(path: path)

    basket_service = BasketService.new(@restaurant, cookies['emenu_basket'])
    @basket = basket_service.get_basket_db.contents

    basket_ids =  @basket.present? ? @basket['ids'] : []
    basket_service.add_to_basket(params[:main_item], params[:items]&.split(','), params[:note]&.gsub('|||','.'))

    menu_id = params[:menu_id] if params[:menu_id].present?
  
    return_path = restaurant_path_path(path)

    return_path = order_menu_path(path, menu_id) if feature_match('menu_in_sections', @restaurant.features) && menu_id.present?
    return_path = order_menu_section_path(path, menu_id, params[:section_id]) if feature_match('menu_in_sections', @restaurant.features) && menu_id.present? && params[:section_id].present?

    respond_to do |format|
      format.html { redirect_to return_path, notice: 'Added to basket' }
    end

  end

  def remove_from_basket
    @path = params[:path]

    @restaurant = Restaurant.find_by(path: @path)
    basket_service = BasketService.new(@restaurant, cookies['emenu_basket'])
    
    if basket_service.get_basket
      basket_service.remove_from_basket(params[:uuid])
    end

    menu_id = params[:menu_id]
    section_id = params[:section_id]
    
    if params[:menu_id].blank? or params[:section_id].blank?
      ids = basket_service.get_menu_item.ancestry.split('/')
      menu_id = ids.first
      section_id = ids[1]
    end

    path = restaurant_path_path(@path)
    path = order_menu_section_path(@path, menu_id, section_id) if feature_match('menu_in_sections', @restaurant.features) and params[:section_id].present?
    path = order_menu_path(@path, menu_id) if feature_match('menu_in_sections', @restaurant.features) and params[:section_id].blank?

    respond_to do |format|
      format.html { redirect_to path, notice: 'Removed from basket' }
    end
  end


  def feature_match(feature, restaurant_features)
    restaurant_features.map{|s| s.key.to_sym}.include?(feature.to_sym)
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
    @basket_key = JSON.parse(cookies['emenu_basket'])['key'] if cookies[:emenu_basket]
    @basket_db = Basket.find_or_create_by(key: @basket_key)
    @basket = @basket_db.contents
    # delay_time_minutes = @restaurant.delay_time_minutes
    # delay_time_minutes = 30 if delay_time_minutes.blank? 
    
    # t = Time.new.in_time_zone('Europe/London') + delay_time_minutes.minutes
    # rounded_t = Time.local(t.year, t.month, t.day, t.hour, t.min/15*15)
    # @delivery_time_options = ["ASAP"]
    # until rounded_t > Time.local(t.year, t.month, t.day, 22, 00)
    #   @delivery_time_options << rounded_t.strftime("%H:%M")
    #   rounded_t = rounded_t + 30.minutes
    # end
    @delivery_time_options = @restaurant.available_times


    if @basket
       @basket_item_count = @basket['count']
      @basket_item_total =  (@basket['ids'].map{|d| d['total']}.inject(:+)*100.to_f).to_i
    end
    # @publish_stripe_api_key = ENV['PUBLISH_STRIPE_API_KEY'] || Rails.application.credentials.dig(:stripe, :publish_api_key) 

    # @google_maps_api_key = Rails.application.credentials.dig(:google, :maps_api_key) 


end

def pay

  @redirect_domain =  Rails.application.credentials.dig(:apple_pay, :redirect_domain)

  @path = params[:path]
  @service_type = params[:service_type]
  @restaurant = Restaurant.find_by(path: @path)
  @publish_stripe_api_key = @restaurant.stripe_pk_api_key

  @total_payment = params[:total].to_f

  @service_type = params[:service_type] 
  @collection_time = params[:collection_time] 
  @table_number = params[:table_number]
  @name = params[:name] 
  @telephone = params[:telephone] 
  @email = params[:email] 
  @house_number = params[:house_number] 
  @street = params[:street] 
  @postcode = params[:postcode]
  @basket = params[:basket] 
  @delivery_fee = params[:delivery_fee] 

 
  @payment_in_pence = (@total_payment * 100).to_i

  Stripe.api_key = @restaurant.stripe_sk_api_key
  #Create Stripe Transaction
  @payment_intent = Stripe::PaymentIntent.create({
  amount: @payment_in_pence ,
  currency: 'gbp',
  payment_method_types: ['card'],
  description: "#{@path} charge"  
})
#  binding.pry


end

  def stripe





    @service_type = params[:service_type] 
    @collection_time = params[:collection_time] 
    @table_number = params[:table_number]
    @name = params[:name] 
    @telephone = params[:telephone] 
    @email = params[:email] 
    @house_number = params[:house_number] 
    @street = params[:street] 
    @postcode = params[:postcode]
    @basket = params[:basket] 
    @delivery_fee = params[:delivery_fee] 

    @address = "#{@house_number}, #{@street}, #{@postcode}" 
    

    error = false
    success = false
    @path = params[:path]

    @restaurant = Restaurant.find_by(path: @path)


    @basket_key = JSON.parse(cookies['emenu_basket'])['key'] if cookies[:emenu_basket]
    @basket_db = Basket.find_or_create_by(key: @basket_key)
    @basket = @basket_db.contents

    if @basket
      @basket_item_count = @basket['count']
      @basket_item_total =  @basket['ids'].map{|d| d['total']}.inject(:+)
    end
 
    items = @basket['ids']

    price = params[:price].to_i

    Rails.logger.debug("Payment Price: #{price}")
  
    begin

      stripe_data = {}
      stripe_token = {}

      # binding.pry
      

      if params[:stripe_success_token].present?
        
        if params['apple_and_google'].present?
          @stripe_payment_intent = params[:stripe_success_token]
        else
          @stripe_payment_intent = JSON.parse(params[:stripe_success_token])
        end

        if @stripe_payment_intent['status'] == 'succeeded'
          success = true
          stripe_token = @stripe_payment_intent['id']
          stripe_data = @stripe_payment_intent
        end 
      end

      if success
 
        @receipt =  Receipt.create(
            uuid: SecureRandom.uuid,
            restaurant_id: @restaurant.id,
            basket_total: price,
            items: basket_build(@basket['ids']),
            email: @email,
            name: @name,
            collection_time: @collection_time,
            stripe_token: stripe_token,
            status: stripe_data,
            is_ready: false,
            source: :takeaway, 
            telephone: @telephone,
            address: @address,
            delivery_or_collection: @service_type,
            delivery_fee: @delivery_fee , 
            table_number: @table_number
          )
  
      else
        error = true
      end #if succeeded
  

        rescue Exception => e
          error = true
        puts e
        puts "****************************************************************"
        puts "ERROR: #{e} ***********************************"
        puts "****************************************************************"
        puts "params: #{params} ***********************************"
        puts "****************************************************************"
      
      end

        
    if success 
        # if @stripe_payment_intent['status'] == 'succeeded'
          cookies.delete :emenu_basket
      # end
    end


  

    puts "****************************************************************"
    puts "RECEIPT: #{@receipt.inspect} ***********************************"
    puts "****************************************************************"




    respond_to do |format|
      if error
        format.html { redirect_to checkout_path(@path), alert: "Payment Error: #{e.message}" } 
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
  

    def get_serialized_menu restaurant
        Rails.cache.fetch("restaurant_order_menu_#{@restaurant.id}", expires_in: 3.hours) do
        

        active_ids = @restaurant.active_menu_ids

          @menu2 = @restaurant.menus_live_menus.where(root_node_id: active_ids).arrange_serializable(order: :position) do |parent, children|

          

          
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
            calories: parent.calories,
            is_deleted: parent.is_deleted, 
            item_screen_type_id: parent.item_screen_type_id,
            item_screen_type_name: parent.item_screen_type_name,
            item_screen_type_key: parent.item_screen_type_key,
 
            secondary_item_screen_type_id: parent.secondary_item_screen_type_id,
            secondary_item_screen_type_name: parent.secondary_item_screen_type_name,
            secondary_item_screen_type_key: parent.secondary_item_screen_type_key
          }

    
          end
  
      end
    end




  
  
  end
   