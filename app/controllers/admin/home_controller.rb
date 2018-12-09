module Admin
class HomeController < ApplicationController

	before_action :authenticate_restaurant_user!, only: [:restaurant_users_authenticated]



  def index
  end

  def restaurant_user_authenticated
    @restaurant = current_admin_restaurant_user.restaurant
  end

end
end