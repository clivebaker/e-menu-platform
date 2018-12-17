# frozen_string_literal: true

class AddRestaurantUserReferencesToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :restaurant_user, foreign_key: true
  end
end
