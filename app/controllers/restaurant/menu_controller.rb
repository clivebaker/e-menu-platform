class Restaurant::MenuController < ApplicationController
  def index


  	slug = params[:slug]
  	@restaurant = Restaurant.find_by(slug: slug)



  end
end
