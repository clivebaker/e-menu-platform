class ReceiptService < ApplicationController

  def initialize(order)
    @order = order
    @checkout_session = Stripe::Checkout::Session.retrieve(@order.stripe_data["id"])
  end

  def check_checkout_status
    @order.update_attribute(:stripe_data, @checkout_session)
  end

end
