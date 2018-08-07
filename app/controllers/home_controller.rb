class HomeController < ApplicationController

	before_action :authenticate_resturant_user!, only: [:resturant_users_authenticated]

  def index
  end

  def resturant_user_index
  end

  def resturant_user_authenticated
  	
  end

  def user_index
  end
end
