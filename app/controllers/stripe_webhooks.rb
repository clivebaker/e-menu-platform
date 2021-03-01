class StripeWebhooksController < ApplicationController
  def webhook
    EventFilterService.new(request)
  end
end