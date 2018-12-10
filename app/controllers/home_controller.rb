class HomeController < ApplicationController


  def index

  	@restaurants = Restaurant.all

  end

  def register_table

  	@code = params[:code]
  	@table = Table.find_by(code: @code)
  	
  end


end
