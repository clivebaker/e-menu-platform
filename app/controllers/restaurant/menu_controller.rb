class Restaurant::MenuController < ApplicationController
  def index


  	slug = params[:slug]
  	@restaurant = Restaurant.find_by(slug: slug)



  end
  def name


  	name = params[:name]
  	@restaurant = Restaurant.find_by(path: name)
    redirect_to restaurant_menu_path(@restaurant.slug)


  end
end
