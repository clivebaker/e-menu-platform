class OrderController < ApplicationController
  before_action :authenticate_user!, except: [:index, :add_to_basket, :stripe, :receipt, :basket, :checkout, :remove_from_basket]
  skip_before_action :verify_authenticity_token, only: %i[stripe]
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
    if @basket
      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  (@basket['items'].map{|d| d['total']}.inject(:+)*100.to_f).to_i
    end
    @publish_stripe_api_key = ENV['PUBLISH_STRIPE_API_KEY'] || Rails.application.credentials.dig(:stripe, :publish_api_key) 
    # Stripe.api_key = ENV['STRIPE_API_KEY'] || Rails.application.credentials.dig(:stripe, :api_key) 

    # @intent = Stripe::PaymentIntent.create({
    #   amount: @basket_item_total,
    #   currency: 'gbp',
    #   # Verify your integration in this guide by including this parameter
    #   metadata: {integration_check: 'accept_a_payment'},
    # })



end


def stripe
    @path = params[:path]
    @restaurant = Restaurant.find_by(path: @path)
    @basket = cookies[:basket]
    if @basket
      @basket = JSON.parse(@basket)
      @basket_item_count = @basket['count']
      @basket_item_total =  @basket['items'].map{|d| d['total']}.inject(:+)
    end
    Stripe.api_key =  ENV['STRIPE_API_KEY'] || Rails.application.credentials.dig(:stripe, :api_key) 

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
      


    cookies.delete :basket
    @receipt = Receipt.create(
      restaurant: @path,
      basket_total: price,
      items: @basket, 
      stripe_token: token,
      status: @status,
      name: params[:name]
    ) 



    body =  {
        restaurant_id: @restaurant.emenu_id,
        uuid: @receipt.uuid,
        basket_total: price,
        items: @basket,
        stripe_token: token,
        status: @status,
        is_ready: false,
        name: @receipt.name
    }
    puts "****************************************************************"
    puts "****************************************************************"
    puts "****************************************************************"
    puts "BODY: #{body}"
    resp = Faraday.post("#{Rails.configuration.platform_api_path}/receipts") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = body.to_json
    end



    rescue Exception => e
      error = e
    end




    if error.present?
      redirect_to receipt_path(@path, @receipt.uuid), alert: "Payment Error: #{e.message}" 
    else
      redirect_to receipt_path(@path, @receipt.uuid), notice: "Payment Successful"
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
      
      @menu =  @restaurant.menus
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
      items = params[:items]
   
      response_m = HTTParty.get("#{Rails.configuration.platform_api_path}/api/v1/menu_item/#{main_item}")
      menu_item = JSON.parse(response_m.body)

      response_mi = HTTParty.get("#{Rails.configuration.platform_api_path}/api/v1/menu_optionals/#{items}")
      optionals = JSON.parse(response_mi.body)

      total = ("%.2f" % menu_item['price']).to_f
      total += optionals.map{|s| ("%.2f" % s['price']).to_f }.inject(:+) if optionals.present?
      uuid = SecureRandom.uuid
      basket_items << {uuid: uuid, total: total ,item: menu_item['name'] , optionals: optionals.map{|s| s['name']} }
      basket_ids << {uuid: uuid, total: total,item: menu_item['id'], optionals: optionals.map{|s| s['id'] }}

      cookies[:basket] = {
        restaurant: path,
        count: basket_ids.count,
        items: basket_items,
        ids: basket_ids 
    }.to_json

      puts "**********************************************************"
      puts "**********************************************************"
      puts "**********************************************************"
      puts main_item.inspect
      puts items.inspect
      puts "**********************************************************"
      puts "**********************************************************"
    
      puts menu_item.inspect
      puts optionals.inspect
      puts "**********************************************************"
      puts "**********************************************************"

        respond_to do |format|
          format.html { redirect_to restaurant_path_path(path), notice: 'Added to basket' }
        end

    end
  
  
  end
   