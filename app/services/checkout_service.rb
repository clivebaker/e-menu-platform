class CheckoutService < ApplicationController

  attr_accessor :name, :total_payment, :service_type, :collection_time, :telephone, :address,
                :table_number, :email, :house_number, :street, :postcode, :basket, :delivery_fee, :discount_code, :payment_in_pence

  def initialize(restaurant, parameters, basket_service)
    parameters.each_pair {|k,v|instance_variable_set("@#{k}", v)}
    @restaurant = restaurant
    @basket_service = basket_service

    @total_payment = @total.to_f 
    @payment_in_pence = (@total_payment*100).to_i
    @address = "#{@house_number}, #{@street}, #{@postcode}"
  end

  def create_transaction
    Stripe.api_key = @restaurant.stripe_sk_api_key

    Stripe::PaymentIntent.create({
      amount: (@basket_service.get_basket_item_total * 100).to_i,
      currency: @restaurant.currency_code,
      payment_method_types: ['card'],
      description: "#{@path} charge",
      application_fee_amount: application_fee_amount((@basket_service.get_basket_item_total * 100).to_i, @restaurant),
      transfer_data: {
        destination: @restaurant.stripe_connected_account_id
      },  
    })
  end

  def create_checkout_session
    @receipt = generate_receipt
    Stripe.api_key = @restaurant.stripe_sk_api_key
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      payment_intent_data: {
        application_fee_amount: application_fee_amount((@basket_service.get_basket_item_total * 100).to_i, @restaurant),
        on_behalf_of: @restaurant.stripe_connected_account_id,
        transfer_data: {
          destination: @restaurant.stripe_connected_account_id
        }
      },
      line_items: [{
        price_data: {
          currency: @restaurant.currency_code,
          product_data: {
            name: "Restaurant order for #{@restaurant.name}",
          },
          unit_amount: (@basket_service.get_basket_item_total * 100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: (Rails.env.development? ? 'https://eat.emenunow.com' : Rails.application.routes.url_helpers.receipt_path(@restaurant.path, @receipt.uuid, checkout_status: "success"))+"?&uuid=#{@receipt.uuid}&session_id={CHECKOUT_SESSION_ID}",
      cancel_url: (Rails.env.development? ? 'https://eat.emenunow.com' : Rails.application.routes.urlurl_helpers.restaurant_url(@restaurant.path, checkout_status: "cancel"))+"?status=success&",
    }.merge(shipping_details))

    { id: session.id }.to_json
  end

  def make_payment
  end

  def generate_receipt
    if @stripe_success_token.present?
      if @apple_and_google.present?
        @stripe_payment_intent = @stripe_success_token
      else
        @stripe_payment_intent = JSON.parse(@stripe_success_token)
      end

      if @stripe_payment_intent['status'] == 'succeeded'
        success = true
        stripe_token = @stripe_payment_intent['id']
        stripe_data = @stripe_payment_intent
      end 
    end

    Order.create(
      uuid: SecureRandom.uuid,
      restaurant_id: @restaurant.id,
      basket_total: @total_payment * 100,
      items: @basket_service.basket_build(@basket_service.get_basket_db.contents['ids']),
      email: @email,
      name: @name,
      collection_time: @collection_time,
      stripe_token: stripe_token || {},
      status: stripe_data || {},
      is_ready: false,
      source: :takeaway, 
      telephone: @telephone,
      address: @address,
      delivery_or_collection: @service_type,
      delivery_fee: @delivery_fee, 
      table_number: @table_number,
      discount_code: @basket_service.discount_code
    )
  end

  def application_fee_amount(payment, restaurant)
    ((payment * ((restaurant.commision_percentage.presence || 1.5)/100))*1.2).to_i
  end

  def shipping_details
    if @basket_service.service_type.nil?
      { 
        shipping_address_collection: {
          allowed_countries: ['GB', 'CA']
        }
      }
    else
      {}
    end
  end

end
