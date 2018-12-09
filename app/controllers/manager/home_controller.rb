module Manager
class HomeController < Manager::BaseController

	before_action :authenticate_manager_restaurant_user!, except: [:index]



  def index
       @restaurant = current_manager_restaurant_user.restaurant if current_manager_restaurant_user
  end

  def menu
    @restaurant = current_manager_restaurant_user.restaurant
  end

  def dashboard
    @restaurant = current_manager_restaurant_user.restaurant
  end

end
end