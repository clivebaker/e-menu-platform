class StripeWebhooksController < ApplicationController
  def index
    EventFilterService.new(request)
  end
end