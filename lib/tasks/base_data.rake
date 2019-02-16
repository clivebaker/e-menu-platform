require 'rubygems'
require 'yaml'
require 'json'


namespace :base_data do

	desc 'Import all'
	task all: :environment do 
		puts 'Importing All'
		Rake::Task["base_data:cuisines"].invoke
		Rake::Task["base_data:features"].invoke
		Rake::Task["base_data:spice_levels"].invoke
		Rake::Task["base_data:languages"].invoke
		Rake::Task["base_data:menu_item_categorisation"].invoke
		#Rake::Task["base_data:"].invoke
		# Rake::Task["base_data:"].invoke
		# Rake::Task["base_data:"].invoke
		# Rake::Task["base_data:"].invoke
		# Rake::Task["base_data:"].invoke
		# Rake::Task["base_data:"].invoke


	end

  desc "Importing Base Data - Cuisines"
  task cuisines: :environment do
  	puts 'Importing Cuisines'
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
  	puts 'Importing Features'
  	Feature.create(name: 'Images', key: 'images')
  	Feature.create(name: 'Nutrition', key: 'nutrition')
  	Feature.create(name: 'Provenance', key: 'provenance')
  	Feature.create(name: 'Payment', key: 'payment')
  	Feature.create(name: 'Ordering', key: 'ordering')
  	Feature.create(name: 'Order Customer Name', key: 'order_customer_name')
	end
  task spice_levels: :environment do
  	puts 'Importing Spice Levels'
		SpiceLevel.create(name: 'None', icon: 'fi fi-none')
		SpiceLevel.create(name: 'Extra Mild', icon: 'fi fi-chilli1')
		SpiceLevel.create(name: 'Mild', icon: 'fi fi-chilli2')
		SpiceLevel.create(name: 'Medium', icon: 'fi fi-chilli3')
		SpiceLevel.create(name: 'Hot', icon: 'fi fi-chilli4')
		SpiceLevel.create(name: 'Extra Hot', icon: 'fi fi-chilli5')
	end
	desc "Importing Base Data - Languages"
  task languages: :environment do
  	puts 'Importing Languages'
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
  	puts 'Importing Menu Item Categorisation'
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

  	puts 'Importing Restaurant'
  	def categorization(str)
  		MenuItemCategorisation.find_by(name: str)
  	end
  	def spice
  		SpiceLevel.order("RANDOM()").first
  	end

  	puts 'Importing Restaurant::RestaurantUser'
  	restaurant_user = RestaurantUser.create(email: 'clive@clivebaker.com', password: 'cliveb1', roles: [:admin])

  	puts 'Importing Restaurant::Restaurant'
  	cuisine = Cuisine.order("RANDOM()").first
  	restaurant = Restaurant.create(name: 'Test Restaurant', address: '66 Meadowcroft',postcode: 'AL1 1UF',telephone: '07900987482',email: 'clive@e-me.nu', cuisine_id: cuisine.id , restaurant_user_id: restaurant_user.id)
  	features = Feature.all
  	features.each do |feature|
  		restaurant.features << feature
  	end



  	puts 'Importing Restaurant::RestaurantTables'
  	table1 = RestaurantTable.create(number: 1, restaurant_id: restaurant.id, number_seats: 2)
  	table1.code = 'AAAAAA'
  	table1.save
  	table2 = RestaurantTable.create(number: 2, restaurant_id: restaurant.id, number_seats: 2)
  	table2.code = 'BBBBBB'
  	table2.save
  	table3 = RestaurantTable.create(number: 3, restaurant_id: restaurant.id, number_seats: 4)
  	table3.code = 'CCCCCC'
  	table3.save
  	table4 = RestaurantTable.create(number: 4, restaurant_id: restaurant.id, number_seats: 4)
  	table4.code = 'DDDDDD'
  	table4.save
  	table5 = RestaurantTable.create(number: 5, restaurant_id: restaurant.id, number_seats: 6)
  	table6 = RestaurantTable.create(number: 6, restaurant_id: restaurant.id, number_seats: 8)






  	puts 'Importing Restaurant::Custom Lists'
  	list1 = CustomList.create(name: 'Cooking', constraint: '*', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Rare', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium Rare', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium Well Done', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Well Done', price: 0)

  	list2 = CustomList.create(name: 'Spice Levels', constraint: '1', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list2.id, name: 'Lemon and Herb', price: 0)
						CustomListItem.create(custom_list_id: list2.id, name: 'Mango and Lime', price: 0)
						CustomListItem.create(custom_list_id: list2.id, name: 'Medium', price: 0)
						CustomListItem.create(custom_list_id: list2.id, name: 'Hot', price: 0)
  	
  	list3 = CustomList.create(name: 'Sides', constraint: '2', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list3.id, name: 'Fries', price: 0)
						CustomListItem.create(custom_list_id: list3.id, name: 'Sweet Potato Fries', price: 0.5)
						CustomListItem.create(custom_list_id: list3.id, name: 'Mash', price: 0)
  	
  	list4 = CustomList.create(name: 'Steak Sauces', constraint: '1', restaurant_id: restaurant.id)
						CustomListItem.create(custom_list_id: list4.id, name: 'Pepper', price: 1.45)
						CustomListItem.create(custom_list_id: list4.id, name: 'Bernaise', price: 1.34)
						CustomListItem.create(custom_list_id: list4.id, name: 'Mushroom', price: 0.99)
						CustomListItem.create(custom_list_id: list4.id, name: 'Blue Cheese', price: 2)

		
  	puts 'Importing Restaurant::Menu'
  	menu = Menu.create(name: 'Main Menu', restaurant_id: restaurant.id, node_type: 'menu')
  	menu.translate

  	puts 'Importing Restaurant::Starters'
  	starters = Menu.create(name: 'Starters', parent: menu, restaurant_id: restaurant.id, node_type: 'section')
		starters.translate

	  	puts 'Importing Restaurant::Soup'
  		soup = Menu.create(name: 'Soups', parent: starters, restaurant_id: restaurant.id, node_type: 'section')
  		soup.translate

	  	puts 'Importing Restaurant::Cucumber'
  		cucumber = Menu.create(
  											name: 'Cucumber', 
  											description: 'A refreshing flavorful recipe for Chilled Cucumber Soup with yogurt, cilantro, coriander and lime', 
  											parent: soup, 
  											restaurant_id: restaurant.id, 
  											node_type: 'item', 
  											available: true, 
  											calories: 234, 
  											price_a: 4.29, 
  											nutrition: 'nutrit', 
  											provenance: 'prov', 
  											menu_item_categorisation_ids: [categorization('Vegetarian').id], 
												spice_level_id: spice.id)
  		cucumber.image.attach(io: File.open("#{Rails.root}/images/cucumber.jpg"), filename: 'cucumber.jpg', content_type: 'image/jpg')
			cucumber.translate

  		tomato = Menu.create(
  											name: 'Tomato', 
  											description: "Three ingredient tomato soup. You wouldn't think that three ingredients — butter, onion and tomato — can come together to make such a velvety and delicious tomato soup", 
  											parent: soup, 
  											restaurant_id: restaurant.id, 
  											node_type: 'item', 
  											available: true, 
  											calories: 180, 
  											price_a: 3.99, 
  											nutrition: 'nutrit', 
  											provenance: 'prov', 
  											menu_item_categorisation_ids: [categorization('Vegetarian').id], 
												spice_level_id: spice.id)
  		tomato.image.attach(io: File.open("#{Rails.root}/images/tomato.jpg"), filename: 'tomato.jpg', content_type: 'image/jpg')
  		tomato.translate







	  	puts 'Importing Restaurant::Salad'
  		salad = Menu.create(name: 'Salad', parent: starters, restaurant_id: restaurant.id, node_type: 'section')
  		salad.translate

  		caesar = Menu.create(
  											name: 'Caesar', 
  											description: "a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper.", 
  											parent: salad, 
  											restaurant_id: restaurant.id, 
  											node_type: 'item', 
  											available: true, 
  											calories: 250, 
  											price_a: 5.10, 
  											nutrition: 'nutrit', 
  											provenance: 'prov', 
  											menu_item_categorisation_ids: [categorization('Vegetarian').id, categorization('Chicken').id], 
												spice_level_id: spice.id)
  		caesar.image.attach(io: File.open("#{Rails.root}/images/caesar.jpg"), filename: 'caesar.jpg', content_type: 'image/jpg')
  		caesar.translate

  		greek = Menu.create(
  											name: 'Greek', 
  											description: "A fresh and colourful salad that's great with grilled meats, or on its own as a main.", 
  											parent: salad, 
  											restaurant_id: restaurant.id, 
  											node_type: 'item', 
  											available: true, 
  											calories: 250, 
  											price_a: 5.10, 
  											nutrition: 'nutrit', 
  											provenance: 'prov', 
  											menu_item_categorisation_ids: [categorization('Vegetarian').id], 
												spice_level_id: spice.id)
  		greek.image.attach(io: File.open("#{Rails.root}/images/greek.jpg"), filename: 'greek.jpg', content_type: 'image/jpg')
  		greek.translate


  		puts 'Importing Restaurant::Other Starters'
  		#Base Starters
  		halloumi = Menu.create(
									name: 'Halloumi', 
									description: "Halloumi is a Cypriot firm, brined, slightly springy white cheese, traditionally made from a mixture of goat and sheep", 
									parent: starters, 
									restaurant_id: restaurant.id, 
									node_type: 'item', 
									available: true, 
									calories: 250, 
									price_a: 4.39, 
									nutrition: 'nutrit', 
									provenance: 'prov', 
									menu_item_categorisation_ids: [categorization('Vegetarian').id], 
									spice_level_id: spice.id)
  		halloumi.image.attach(io: File.open("#{Rails.root}/images/halloumi.jpg"), filename: 'halloumi.jpg', content_type: 'image/jpg')
			halloumi.translate

			calamari = Menu.create(
									name: 'Calamari', 
									description: "Fried squid (fried calamari, calamari) is a dish in Mediterranean cuisine. It consists of batter-coated, deep fried squid, fried for less than two minutes to prevent toughness. It is served plain, with salt and lemon on the side.", 
									parent: starters, 
									restaurant_id: restaurant.id, 
									node_type: 'item', 
									available: true, 
									calories: 250, 
									price_a: 6.10, 
									nutrition: 'nutrit', 
									provenance: 'prov', 
									menu_item_categorisation_ids: [categorization('Shellfish').id, categorization('Fish').id], 
									spice_level_id: spice.id)
  		calamari.image.attach(io: File.open("#{Rails.root}/images/calamari.png"), filename: 'calamari.png', content_type: 'image/png')
  		calamari.translate

  		
  		
  	puts 'Importing Restaurant::Mains'
  	mains = Menu.create(name: 'Mains', parent: menu, restaurant_id: restaurant.id, node_type: 'section')
  	mains.translate

		lamb = Menu.create(
								name: 'Lamb Shank', 
								description: "Braised Shank of English Lamb with mash potato, chantenay carrots, peas, rosemary & garlic jus", 
								parent: mains, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 600, 
								price_a: 11.23, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Lamb').id, categorization('Halal').id], 
								spice_level_id: spice.id)
		lamb.image.attach(io: File.open("#{Rails.root}/images/lamb.jpg"), filename: 'lamb.jpg', content_type: 'image/jpg')
		lamb.translate

		bangers = Menu.create(
								name: 'Bangers and Mash', 
								description: "Donnelly special blended Irish sausage served with mashed potato, carrots and turnips topped with a caramelized onion gravy.", 
								parent: mains, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 600, 
								price_a: 9.45, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Pork').id], 
								spice_level_id: spice.id)
		bangers.image.attach(io: File.open("#{Rails.root}/images/bangers.jpg"), filename: 'bangers.jpg', content_type: 'image/jpg')
		bangers.translate

		pie = Menu.create(
								name: 'Steak and Ale Pie', 
								description: "Traditional English pie inspired by the fells of the lake district and a long walk up Pavey Arc and Stickle Tarn in the snow.", 
								parent: mains, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 600, 
								price_a: 8.99, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Beef').id], 
								spice_level_id: spice.id)
		pie.image.attach(io: File.open("#{Rails.root}/images/pie.jpg"), filename: 'pie.jpg', content_type: 'image/jpg')
		pie.translate

		steak = Menu.create(
								name: 'Ribeye', 
								description: "Succulent Ribeye steak", 
								parent: mains, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 600, 
								price_a: 14.32, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Beef').id], 
								spice_level_id: spice.id, 
								custom_lists: {
									list1.id.to_s => list1.custom_list_items.map{|w| w.id.to_s},
									list3.id.to_s => list3.custom_list_items.map{|w| w.id.to_s},
									list4.id.to_s => list4.custom_list_items.map{|w| w.id.to_s},

								}
								)
		steak.image.attach(io: File.open("#{Rails.root}/images/steak.png"), filename: 'steak.png', content_type: 'image/png')
		steak.translate












  	puts 'Importing Restaurant::Desserts'
  	desserts = Menu.create(name: 'Desserts', parent: menu, restaurant_id: restaurant.id, node_type: 'section')
		desserts.translate

		pavlova = Menu.create(
								name: 'Pavlova', 
								description: "Coconut curd, passion fruit, vanilla cream, watermelon, kiwi", 
								parent: desserts, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 400, 
								price_a: 3.75, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Vegetarian').id], 
								spice_level_id: spice.id)
		pavlova.image.attach(io: File.open("#{Rails.root}/images/pavlova.jpg"), filename: 'pavlova.jpg', content_type: 'image/jpg')
		pavlova.translate

		trifle = Menu.create(
								name: 'Trifle', 
								description: "A dessert made with fruit, a thin layer of sponge fingers soaked in sherry, and custard. It is topped with whipped cream.", 
								parent: desserts, 
								restaurant_id: restaurant.id, 
								node_type: 'item', 
								available: true, 
								calories: 450, 
								price_a: 2.99, 
								nutrition: 'nutrit', 
								provenance: 'prov', 
								menu_item_categorisation_ids: [categorization('Vegetarian').id], 
								spice_level_id: spice.id)
		trifle.image.attach(io: File.open("#{Rails.root}/images/trifle.jpg"), filename: 'trifle.jpg', content_type: 'image/jpg')
		trifle.translate





  end




end

