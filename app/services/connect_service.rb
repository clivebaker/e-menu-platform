class ConnectService < ApplicationController

  # attr_accessor :name, :total_payment, :service_type, :collection_time, :telephone, :address

  def initialize(restaurant)
    @restaurant = restaurant

    Stripe.api_key = Rails.env == 'production' ? ENV['STRIPE_API_KEY'] : 'sk_test_hOj5WqYB26UV1v5uuqXsADSG'
    @origin = Rails.env == 'development' ? 'http://localhost:3000' : request.headers['origin'] || "https://#{request.headers['host']}"
  end

  def create_account
    account = Stripe::Account.create({
      type: 'standard',
      country: @restaurant.currency.code == 'cad' ? 'CA' : 'GB',
      email: @restaurant.restaurant_user.email,
      default_currency: @restaurant.currency.code,
    })

    account_link = Stripe::AccountLink.create({
      account: account.id,
      refresh_url: "#{@origin}/onboarding/restaurants/#{@restaurant.id}/connect",
      return_url: "#{@origin}/onboarding/restaurants/#{@restaurant.id}/complete",
      type: 'account_onboarding',
    })
    
    {
    url: account_link.url,
    account_id: account.id
    }
  end
  
  def refresh_account(account_id)
    account_link = Stripe::AccountLink.create({
      account: account_id,
      refresh_url: "#{@origin}/onboarding/restaurants/#{@restaurant.id}/connect",
      return_url: "#{@origin}/onboarding/restaurants/#{@restaurant.id}/complete",
      type: 'account_onboarding',
      })
      
    url = account_link.url
  end

  def get_account
    account = Stripe::Account.retrieve(
      @restaurant.stripe_connected_account_id
    )
  end

end
