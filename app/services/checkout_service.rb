class CheckoutService < ApplicationController

  attr_accessor :name, :total_payment, :service_type, :collection_time, :telephone, :address,
                :table_number, :email, :house_number, :street, :postcode, :basket, :delivery_fee, :discount_code, :payment_in_pence, :basket_service

  def initialize(restaurant, parameters, basket_service)

    parameters.each_pair {|k,v|instance_variable_set("@#{k}", v)}
    @restaurant = restaurant
    @basket_service = basket_service
    @patron = @basket_service.patron

    @total_payment = @total.to_f 
    @payment_in_pence = (@total_payment*100).to_i
    @address = "#{@house_number}, #{@street}, #{@postcode}"
  end

  def create_checkout_session
    @order = generate_order
    Stripe.api_key = @restaurant.stripe_sk_api_key
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      payment_intent_data: {
        application_fee_amount: application_fee_amount(@order.value, @restaurant),
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
          unit_amount: @order.value,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: (Rails.env.development? ? 'https://eat.emenunow.com' : Rails.application.routes.url_helpers.receipt_url(@restaurant.path, @order.uuid, checkout_status: "success"))+"?&uuid=#{@order.uuid}&session_id={CHECKOUT_SESSION_ID}&checkout_status=success",
      cancel_url: (Rails.env.development? ? 'https://eat.emenunow.com' : Rails.application.routes.url_helpers.restaurant_url(@restaurant.path, checkout_status: "cancel"))+"?checkout_status=cancel&",
    }
    # .merge(shipping_details)
    )
    @order.status = @session.payment_status
    @order.stripe_data = @session
    @order.stripe_token = @session.id
    @order.save!

    { id: @session.id }.to_json
  end

  def make_payment
  end

  private

  def generate_order  
    @order = Order.create(
      uuid: SecureRandom.uuid,
      restaurant_id: @restaurant.id,
      basket_total: to_stripe_amount(@total_payment),
      items: @basket_service.basket_build(@basket_service.get_basket_db.contents['ids']),
      email: @email,
      name: @name,
      collection_time: @collection_time,
      is_ready: false,
      telephone: @telephone,
      address: @address,
      delivery_or_collection: @service_type,
      delivery_fee: @delivery_fee, 
      table_number: @table_number,
      discount_code: @basket_service.discount_code,
      value: to_stripe_amount(@total_payment),
      currency: @restaurant.currency.code
    )
    @order.patrons << @patron if @patron and !@order.patrons.include?(@patron)
    @order
  end

  def application_fee_amount(payment, restaurant)
    amount = ((payment * ((restaurant.commision_percentage.presence || 1.5)/100))*1.2).to_i
    amount = ((payment * 0.04) + amount) if restaurant.stripe_chargeback_enabled
    amount
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

  def to_stripe_amount(number)
    (number * 100).round(0).to_i
  end

end
