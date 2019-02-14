require 'rubygems'
require 'yaml'
require 'json'


namespace :base_data do
  desc "Importing Base Data - Cuisines"
  task cuisines: :environment do
		Cuisine.create(name: 'American')
		Cuisine.create(name: 'Afghanistan')
		Cuisine.create(name: 'African')
		Cuisine.create(name: 'Arabic')
		Cuisine.create(name: 'Asian')
		Cuisine.create(name: 'Bangladeshi')
		Cuisine.create(name: 'Brazilian')
		Cuisine.create(name: 'British')
		Cuisine.create(name: 'Caribbean')
		Cuisine.create(name: 'Chicken')
		Cuisine.create(name: 'Chinese')
		Cuisine.create(name: 'Continental')
		Cuisine.create(name: 'Egyptian')
		Cuisine.create(name: 'European')
		Cuisine.create(name: 'French')
		Cuisine.create(name: 'Fusion')
		Cuisine.create(name: 'Greek')
		Cuisine.create(name: 'Healthy')
		Cuisine.create(name: 'Iranian')
		Cuisine.create(name: 'Italian')
		Cuisine.create(name: 'Indian')
		Cuisine.create(name: 'Korean')
		Cuisine.create(name: 'Latinamerican')
		Cuisine.create(name: 'Lebanese')
		Cuisine.create(name: 'Malaysian')
		Cuisine.create(name: 'Mediterranean')
		Cuisine.create(name: 'Mexican')
		Cuisine.create(name: 'Middle-eastern')
		Cuisine.create(name: 'Moroccan')
		Cuisine.create(name: 'Nigerian')
		Cuisine.create(name: 'Oriental')
		Cuisine.create(name: 'Pakistani')
		Cuisine.create(name: 'Portuguese')
		Cuisine.create(name: 'South-indian')
		Cuisine.create(name: 'Spanish')
		Cuisine.create(name: 'Thai')
		Cuisine.create(name: 'Turkish')
		Cuisine.create(name: 'Vietnamese')
		Cuisine.create(name: 'Japanese')
	end
	desc "Importing Base Data - Features"
  task features: :environment do
  	Feature.create(name: 'Images', key: 'images')
  	Feature.create(name: 'Nutrition', key: 'nutrition')
  	Feature.create(name: 'Provenance', key: 'provenance')
  	Feature.create(name: 'Payment', key: 'payment')
  	Feature.create(name: 'Ordering', key: 'ordering')
  	Feature.create(name: 'Order Customer Name', key: 'order_customer_name')
	end
	desc "Importing Base Data - Languages"
  task languages: :environment do
		Language.create(name: "Danish", locale: "da-DK", icon: "flag-dk", language_code: "da")
		Language.create(name: "German", locale: "de", icon: "flag-de", language_code: "de")
		Language.create(name: "Spanish", locale: "es", icon: "flag-es", language_code: "es")
		Language.create(name: "French", locale: "fr", icon: "flag-fr", language_code: "fr")
		Language.create(name: "Italian", locale: "it", icon: "flag-it", language_code: "it")
		Language.create(name: "Latvian", locale: "lv", icon: "flag-lv", language_code: "lv")
		Language.create(name: "Dutch", locale: "nl", icon: "flag-nl", language_code: "nl")
		Language.create(name: "Norwegian", locale: "no-NO", icon: "flag-no", language_code: "no")
		Language.create(name: "Portuguese", locale: "pt", icon: "flag-pt", language_code: "pt")
		Language.create(name: "Russian", locale: "ru", icon: "flag-ru", language_code: "ru")
		Language.create(name: "Slovakian", locale: "sk", icon: "flag-sk", language_code: "sk")
		Language.create(name: "Swedish", locale: "sv", icon: "flag-sv", language_code: "sv")
		Language.create(name: "English", locale: "en", icon: "flag-gb", language_code: "en")
	end
	desc "Importing Base Data - MenuItemCategorisation"
  task menu_item_categorisation: :environment do
		MenuItemCategorisation.create(name: "Fish", icon: "fi flaticon-fish")
		MenuItemCategorisation.create(name: "Tofu", icon: "fi flaticon-tofu")
		MenuItemCategorisation.create(name: "Chicken", icon: "fi flaticon-chicken-1")
		MenuItemCategorisation.create(name: "Beef", icon: "fi flaticon-cow")
		MenuItemCategorisation.create(name: "Lamb", icon: "fi flaticon-sheep-1")
		MenuItemCategorisation.create(name: "Shellfish", icon: "fi flaticon-shrimp")
		MenuItemCategorisation.create(name: "Venison", icon: "fi flaticon-deer")
		MenuItemCategorisation.create(name: "Pork", icon: "fi flaticon-pig-1")
		MenuItemCategorisation.create(name: "Goat", icon: "fi flaticon-goat")
		MenuItemCategorisation.create(name: "Vegetarian", icon: "fi flaticon-keyboard-key-v")
		MenuItemCategorisation.create(name: "Halal", icon: "fi flaticon-key-h-of-a-keyboard")
		MenuItemCategorisation.create(name: "Kosher", icon: "fi flaticon-keyboard-key-k")
	end
	desc "Importing Base Data - Restaurant"
  task restaurant: :environment do


  	restaurant_user = RestaurantUser.create(email: 'clive+11@clivebaker.com', password: 'cliveb1', roles: [:admin])
  	cuisine = Cuisine.order("RANDOM()").first
  	restaurant = Restaurant.create(name: 'Test Restaurant', address: '66 Meadowcroft',postcode: 'AL1 1UF',telephone: '07900987482',email: 'clive@e-me.nu', cuisine_id: cuisine.id , restaurant_user_id: restaurant_user.id)
  	features = Feature.all
  	features.each do |feature|
  		restaurant.feature << feature
  	end
  	



  end




end

