# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
  	  alias_method :current_user, :current_manager_restaurant_user # Could be :current_member or :logged_in_user

    layout 'manager'
  end
end
