class ReceiptService < ApplicationController

  def initialize(order)
    @order = order
    Stripe.api_key = @order.restaurant.stripe_sk_api_key
    @checkout_session = Stripe::Checkout::Session.retrieve(@order.stripe_data["id"])
  end

  def check_checkout_status
    @order.update_attribute(:stripe_data, @checkout_session)
  end


  def refund
    Stripe.api_key = @restaurant.stripe_sk_api_key

    Stripe::Refund.create({
      charge: 'ch_1IEzTBJyyGTIkLikradAPznr',
    })
  end

end
