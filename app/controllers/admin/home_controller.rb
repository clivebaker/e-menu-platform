module Admin
class HomeController < Admin::BaseController

	before_action :authenticate_restaurant_user!, only: [:restaurant_users_authenticated]



  def index
       @restaurant = current_admin_restaurant_user.restaurant if current_admin_restaurant_user
  end

  def restaurant_user_authenticated
    @restaurant = current_admin_restaurant_user.restaurant
  end

end
end