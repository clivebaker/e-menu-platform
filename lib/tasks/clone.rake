require 'rubygems'
require 'yaml'
require 'json'


namespace :clone do

  # rails "clone:restaurant[clive+clone@clivebaker.com, cliveb1, nandozy, 3]"
  # rails "clone:restaurant[clive+clone5@clivebaker.com, cliveb1, nando_clive2, 3]"
	desc "Cloning Restaurant"
    task :restaurant, [:email, :password, :new_restaurant_name, :clone_restaurant_id] => [:environment] do |t, args|
    


      email = args[:email]
      password = args[:password]
      new_restaurant_name = args[:new_restaurant_name]
      clone_restaurant_id = args[:clone_restaurant_id]

      puts "Restaurant Clone"
      puts "user_name: #{email}"
      puts "password: #{password}"
      puts "new_restaurant_name: #{new_restaurant_name}"
      puts "clone_restaurant_id: #{clone_restaurant_id}"

      restaurant_user = RestaurantUser.find_or_create_by(email: email) do |user|
        user.password = password
        user.password_confirmation = password
      end

      existing_restaurant = Restaurant.find(clone_restaurant_id)

      new_restaurant = existing_restaurant.dup
      new_restaurant.restaurant_user_id = restaurant_user.id
      new_restaurant.path = new_restaurant_name
      new_restaurant.active_menu_ids = []
      new_restaurant.name = new_restaurant_name
      
      new_restaurant.save
      puts new_restaurant.errors.inspect



      CustomList.where(restaurant_id: clone_restaurant_id).each do |custom_list|
        new_custom_list = custom_list.dup
        new_custom_list.restaurant_id = new_restaurant.id
        new_custom_list.save
        custom_list.custom_list_items.each do |custom_list_item|
          new_custom_list_item = custom_list_item.dup
          new_custom_list_item.custom_list_id = new_custom_list.id
          new_custom_list_item.save
        end
      end


     roots = Menu.where(restaurant_id: clone_restaurant_id, ancestry: nil)
     roots.each do |root|
     root.clone_with_modifications!({'restaurant_id' => new_restaurant.id}, nil, :id)
    end




  end






end

