class Restaurant::HomeController < ApplicationController
  def index


  	@restaurants = Restaurant.all



  end
  def show


  	name = params[:name]
  	@restaurant = Restaurant.find(name)



  end
end
