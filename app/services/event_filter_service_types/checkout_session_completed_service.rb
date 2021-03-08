class CheckoutSessionCompletedService
  def initialize(payload)
    @data = payload[:data][:object]
    update_orders

  end

  private

  def update_orders
    @order = Order.where("stripe_data ->> 'payment_intent' = ?", @data[:payment_intent]).first
    @order.update_attributes(
      stripe_data: @data,
      status: @data[:payment_status]
    )
  end
end