require 'rubygems'
require 'yaml'
require 'json'


namespace :gbk do


		# "Fish"
		# "Tofu"
		# "Chicken"
		# "Beef"
		# "Lamb"
		# "Shellfish"
		# "Venison"
		# "Pork"
		# "Goat"
		# "Vegetarian"
		# "Vegan"
		# "Halal"
		# "Kosher"
		# "Alcoholic"
		# "Non-Alcholic"

			# create_item(restaurant.id, starters, {
			# 	name: '',
  	# 		description: '',
  	# 		price: ,
  	# 		position: 1,
  	# 		category: '',
  	# 		image: 'default_image.jpg'})




	desc "Importing Base Data - Restaurant"
  task restaurant: :environment do



  	puts 'Importing Restaurant::GBK: GBK'
  	def categorization(str)
  		MenuItemCategorisation.find_by(name: str)
  	end
  	def spice
  		SpiceLevel.order("RANDOM()").first
  	end
  	def create_item(restaurant_id, parent, item, custom_lists = nil)

  		# {name:,
  		# 	description:,
  		# 	price:,
  		# 	category:,
  		# 	image: 'default_image.jpg'
  		# }

  		new_item = Menu.create(
					name: item[:name], 
					description: item[:description], 
					parent: parent, 
					restaurant_id: restaurant_id, 
					node_type: 'item', 
					available: true, 
					calories: rand(180..1200), 
					price_a: item[:price], 
					nutrition: Faker::Lorem.paragraphs.join(' '), 
					provenance: Faker::Lorem.paragraphs.join('<br>'), 
					menu_item_categorisation_ids: [categorization(item[:category]).id], 
					position: item[:position],
					#spice_level_id: spice.id
					)


  		if custom_lists.present?

  		val = {}
  		custom_lists.each do |custom_list|
  			val[custom_list.id.to_s] = custom_list.custom_list_items.map{|s| s.id.to_s}
  		end

  			new_item.custom_lists = val
  			new_item.save
  		end





  		if item[:image].present?
  			new_item.image.attach(io: File.open("#{Rails.root}/images/#{item[:image]}"), filename: item[:image], content_type: 'image/jpg')
			end
			new_item.translate

  		
  	end


  	puts 'Importing Restaurant::GBK::RestaurantUser'
  	restaurant_user = RestaurantUser.create(email: 'clive+gbk@clivebaker.com', password: 'cliveb1', roles: [:admin])

  	puts 'Importing Restaurant::GBK::Restaurant'
  	cuisine = Cuisine.order("RANDOM()").first
  	restaurant = Restaurant.create(name: 'Gourmet Burger Kitchen', address: 'Unit 177A, Intu Watford Shopping Centre, Watford',postcode: 'WD17 2TQ',telephone: '01923 230524',email: 'clive@e-me.nu', cuisine_id: cuisine.id , restaurant_user_id: restaurant_user.id)
  	features = Feature.all #.where("key <> 'images'")
  	features.each do |feature|
  		restaurant.features << feature
  	end



  	puts 'Importing Restaurant::GBK::RestaurantTables'
  	table1 = RestaurantTable.create(number: 1, restaurant_id: restaurant.id, number_seats: 2)
  	table1.code = 'GBK111'
  	table1.save
  	table2 = RestaurantTable.create(number: 2, restaurant_id: restaurant.id, number_seats: 2)
  	table2.code = 'GBK222'
  	table2.save
  	table3 = RestaurantTable.create(number: 3, restaurant_id: restaurant.id, number_seats: 4)
  	table3.code = 'GBK333'
  	table3.save
  	table4 = RestaurantTable.create(number: 4, restaurant_id: restaurant.id, number_seats: 4)
  	table4.code = 'GBK444'
  	table4.save
  	table5 = RestaurantTable.create(number: 5, restaurant_id: restaurant.id, number_seats: 6)
  	table6 = RestaurantTable.create(number: 6, restaurant_id: restaurant.id, number_seats: 8)






  	puts 'Importing Restaurant::GBK::Custom Lists'
  	list1 = CustomList.create(name: 'Cooking', constraint: '1', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium Rare', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Medium Well Done', price: 0)
				  	CustomListItem.create(custom_list_id: list1.id, name: 'Well Done', price: 0)

  	list2 = CustomList.create(name: 'Extras', constraint: '*', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list2.id, name: 'Jalapeños', price: 0.95)
						CustomListItem.create(custom_list_id: list2.id, name: 'Homemade Onion Ring', price: 0.95)
						CustomListItem.create(custom_list_id: list2.id, name: 'Smashed Avocado', price: 1.65)
						CustomListItem.create(custom_list_id: list2.id, name: 'Extra Beef Patty', price: 3.25)
						CustomListItem.create(custom_list_id: list2.id, name: 'Dill Pickle', price: 0.95)
						CustomListItem.create(custom_list_id: list2.id, name: 'Crispy Bacon', price: 1.65)
						CustomListItem.create(custom_list_id: list2.id, name: 'Fried Egg', price: 1.65)
						CustomListItem.create(custom_list_id: list2.id, name: 'Grilled Pineapple', price: 0.95)
  	
  	list3 = CustomList.create(name: 'Add Cheese', constraint: '*', restaurant_id: restaurant.id)
				  	CustomListItem.create(custom_list_id: list3.id, name: 'Mature Cheddar', price: 1.65)
						CustomListItem.create(custom_list_id: list3.id, name: 'American Cheese', price: 1.65)
						CustomListItem.create(custom_list_id: list3.id, name: 'Feta', price: 1.65)
  					CustomListItem.create(custom_list_id: list3.id, name: 'Smoked Applewood', price: 1.65)
  					CustomListItem.create(custom_list_id: list3.id, name: 'Slice of Gorgonzola', price: 1.65)
  	
  	list4 = CustomList.create(name: 'Patty', constraint: '*', restaurant_id: restaurant.id)
						CustomListItem.create(custom_list_id: list4.id, name: 'Veggie Patty', price: 0)
						CustomListItem.create(custom_list_id: list4.id, name: 'Lamb', price: 2.45)
						CustomListItem.create(custom_list_id: list4.id, name: 'Aged Beef', price: 2.45)

 		list5 = CustomList.create(name: 'Advanced Options', constraint: '*', restaurant_id: restaurant.id)
						CustomListItem.create(custom_list_id: list5.id, name: 'Glazed Sesame Bun', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: 'House Mayo', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: 'Tomato', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: 'Red onion', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: '4oz Beef Patty', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: 'Relish', price: 0)
						CustomListItem.create(custom_list_id: list5.id, name: 'Lettuce', price: 0)

 		list6 = CustomList.create(name: 'Go Bunless - No bun', constraint: '*', restaurant_id: restaurant.id)
						CustomListItem.create(custom_list_id: list6.id, name: 'Side Salad & Homeslaw', price: 0.5)
						CustomListItem.create(custom_list_id: list6.id, name: 'Corn & Homeslaw', price: 0.5)

		
  	puts 'Importing Restaurant::GBK::Menu'
  	menu = Menu.create(name: 'GBK', restaurant_id: restaurant.id, node_type: 'menu')
  	menu.translate

  	puts 'Importing Restaurant::GBK::FirstBites'
  	first_bites = Menu.create(name: 'FIRST BITES', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 1)
		first_bites.translate

			create_item(restaurant.id, first_bites, {
				name: 'HALLOUMI BITES',
  			description: 'With kiwifruit & habanero hot sauce',
  			price: 3.95,
  			position: 1,
  			category: 'Vegetarian',
  			image: 'default_image.jpg'})
			create_item(restaurant.id, first_bites, {
				name: 'CHILLI FRIED CHICKEN BITES',
  			description: 'With sriracha mayo',
  			price: 4.65,
  			position: 2,
  			category: 'Chicken',
  			image: 'default_image.jpg'})
			create_item(restaurant.id, first_bites, {
				name: 'CHARGRILLED CHICKEN SKEWERS',
  			description: 'With chipotle mayo',
  			price: 4.65,
  			position: 3,
  			category: 'Chicken',
  			image: 'default_image.jpg'})
			create_item(restaurant.id, first_bites, {
				name: 'COURGETTE FRITTI',
  			description: 'With garlic mayo',
  			price: 4.45,
  			position: 4,
  			category: 'Vegetarian',
  			image: 'default_image.jpg'})


  	puts 'Importing Restaurant::GBK::GoSmaller'
  	go_smaller = Menu.create(name: 'GO SMALLER', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 2)
		go_smaller.translate

		create_item(restaurant.id, go_smaller, {
			name: 'CLASSIC BEEF',
			description: 'House mayo, relish, salad',
			price: 5.65 ,
			position: 1,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, go_smaller, {
			name: 'CLASSIC CHEESE',
			description: 'House mayo, relish, salad. Choose from mature Cheddar, smoked Applewood or American cheese',
			price: 6.85,
			position: 2,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, go_smaller, {
			name: 'CLASSIC CHICKEN',
			description: 'House mayo, relish, salad. Choose from chargrilled or panko crumbed & fried',
			price: 6.95,
			position: 3,
			category: 'Chicken',
			image: 'default_image.jpg'})
		create_item(restaurant.id, go_smaller, {
			name: 'CLASSIC VEGGIE',
			description: 'Homemade & pan-fried bean patty, house mayo, relish, salad',
			price: 5.95,
			position: 4,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

puts 'Importing Restaurant::GBK::Beef'
  	beef = Menu.create(name: 'BEEF', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 3)
		beef.translate

		create_item(restaurant.id, beef, {
			name: 'CLASSIC BEEF',
			description: 'House mayo, relish, salad',
			price: 7.15,
			position: 1,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'CLASSIC CHEESE',
			description: 'House mayo, relish, salad. Choose from mature Cheddar, smoked Applewood or American cheese',
			price: 8.35,
			position: 2,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'GBK CHEESE & BACON',
			description: 'Crispy bacon, BBQ sauce, house mayo, dill pickle, salad. Choose from mature Cheddar, smoked Applewood or American cheese
',
			price: 9.95,
			position: 3,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'THE TAXIDRIVER',
			description: 'American cheese, homemade onion ring, Cajun relish, chipotle mayo, dill pickle, salad',
			price: 10.15,
			position: 4,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'AVO BACON',
			description: 'Smashed avocado, crispy bacon, house mayo, relish',
			price: 9.95,
			position: 5,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'MAJOR TOM',
			description: '30 day dry-aged steak patty, blue cheese slaw, crispy bacon, smoked Applewood cheese, beef ketchup, dill pickle',
			price: 10.95,
			position: 6,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'BLUE CHEESE',
			description: 'Onion jam, Cajun relish, house mayo, salad. Choose from blue cheese sauce or a slice of gorgonzola',
			price: 8.45,
			position: 7,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'THE MIGHTY',
			description: 'Two 6oz patties, mature Cheddar, crispy bacon, garlic mayo, relish, dill pickle',
			price: 12.95,
			position: 8,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'HOT DIGGITY',
			description: 'American & mature Cheddar cheese, chilli fried egg, basil pesto mayo, habanero jam, paprika onions. Allergy - contains nuts or nuts oils',
			price: 9.75,
			position: 9,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])
		create_item(restaurant.id, beef, {
			name: 'KIWIBURGER',
			description: 'Mature Cheddar, beetroot, fried egg, grilled pineapple, house mayo, relish, salad',
			price: 9.85,
			position: 10,
			category: 'Beef',
			image: 'default_image.jpg'}, [list1, list2, list3, list4, list5, list6])


puts 'Importing Restaurant::GBK::chicken'
  	chicken = Menu.create(name: 'CHICKEN', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 4)
		chicken.translate

		create_item(restaurant.id, chicken, {
			name: 'CLASSIC CHICKEN',
			description: 'House mayo, relish, salad. Choose from chargrilled or panko crumbed & fried',
			price: 8.85,
			position: 1,
			category: 'Chicken',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])

		create_item(restaurant.id, chicken, {
			name: 'HEY PESTO',
			description: 'Crispy bacon, mature Cheddar, basil pesto, basil pesto mayo, relish, salad. Allergy - contains nuts or nuts oils',
			price: 9.95,
			position: 2,
			category: 'Chicken',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])

		create_item(restaurant.id, chicken, {
			name: 'SATAY',
			description: 'Warm satay sauce, garlic mayo, rocket, paprika onions, pickled onions, relish. Allergy - contains nuts or nuts oils',
			price: 9.75,
			position: 3,
			category: 'Chicken',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])

		create_item(restaurant.id, chicken, {
			name: 'CHICK CHICK BOOM',
			description: 'Chilli fried chicken, garlic mayo, blue cheese slaw, jalapenos, dill pickle',
			price: 9.45,
			position: 4,
			category: 'Chicken',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])


puts 'Importing Restaurant::GBK::Veggie'
  	veggie = Menu.create(name: 'VEGGIE & VEGAN', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 5)
		veggie.translate

		create_item(restaurant.id, veggie, {
			name: 'CLASSIC VEGGIE',
			description: 'Homemade & pan-fried bean patty, house mayo, relish, salad',
			price: 7.45 ,
			position: 1,
			category: 'Vegetarian',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])
		create_item(restaurant.id, veggie, {
			name: 'FALAFEL',
			description: 'Handmade spinach & kale falafels, jalapeno hummus, tahina sauce, sriracha sauce, rocket, pickled onions',
			price: 8.35,
			position: 2,
			category: 'Vegetarian',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])
		create_item(restaurant.id, veggie, {
			name: 'CALIFORNIAN (VEGAN)',
			description: 'Homemade & pan-fried bean patty, vegan Cheddar, smashed avocado, paprika onions, relish, harissa mayo, salad, sourdough bun',
			price: 9.25,
			position: 3,
			category: 'Vegan',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])
		create_item(restaurant.id, veggie, {
			name: 'JACK-IN-A-BUN (VEGAN)',
			description: 'Homemade butternut squash & quinoa patty, beetroot mayo, Korean pulled jackfruit, pickled onions, rocket, sourdough bun',
			price: 8.95,
			position: 4,
			category: 'Vegan',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])


puts 'Importing Restaurant::GBK::Lamb'
  	lamb = Menu.create(name: 'LAMB', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 6)
		lamb.translate

		create_item(restaurant.id, lamb, {
			name: 'GREEK LAMB',
			description: '6oz lamb, courgette fritti, feta, garlic mayo, jalapeno hummus, rocket, pickled onions',
			price: 10.45,
			position: 1,
			category: 'Lamb',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])
		create_item(restaurant.id, lamb, {
			name: 'CLASSIC LAMB',
			description: '6oz lamb, garlic mayo, relish, salad',
			price: 8.95,
			position: 2,
			category: 'Lamb',
			image: 'default_image.jpg'}, [list2, list3, list4, list5, list6])



# binding.pry
puts 'Importing Restaurant::GBK::Specials'
  	specials = Menu.create(name: 'SPECIALS', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 7)
		specials.translate

		create_item(restaurant.id, specials, {
			name: 'STRAWBERRY & OREO CHEESESHAKE',
			description: '',
			price: 4.90,
			position: 1,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

puts 'Importing Restaurant::GBK::Salads'
  	salads = Menu.create(name: 'SALADS', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 8)
		salads.translate

		create_item(restaurant.id, salads, {
			name: 'CHILLI CHICKEN SALAD',
			description: 'Warm marinated chargrilled chicken, cucumber, tomatoes, cashew nuts, mixed leaves, Peppadews, chilli ginger dressing. Allergy - contains nuts or nuts oils.',
			price: 9.95,
			position: 1,
			category: 'Chicken',
			image: 'default_image.jpg'})

		create_item(restaurant.id, salads, {
			name: 'FALAFEL SALAD',
			description: 'Handmade spinach & kale falafels, avocado, jalapeno hummus, olives, feta, tomatoes, cucumber, pickled onions, tahina sauce, pomegranate dressing',
			price: 9.95,
			position: 2,
			category: 'Vegetarian',
			image: 'default_image.jpg'})



puts 'Importing Restaurant::GBK::Fries'
  	fries = Menu.create(name: 'FRIES & SIDES', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 9)
		fries.translate

		create_item(restaurant.id, fries, {
			name: 'CHUNKY SKIN-ON FRIES',
			description: '',
			price: 3.45,
			position: 1,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'SKINNY FRIES',
			description: '',
			price: 3.45,
			position: 2,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'SWEET POTATO FRIES',
			description: '',
			price: 4.25,
			position: 3,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'TRUFFLE CHEESE FRIES',
			description: 'Chunky fries with truffle cheese sauce, Grana Padano shavings and parsley',
			price: 4.25,
			position: 4,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'HOMEMADE ONION RINGS',
			description: '',
			price: 3.95,
			position: 5,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'GBK HOMESLAW',
			description: 'Cabbage, spring onions, carrot, celeriac, pomegranate seeds, vinaigrette dressing',
			price: 3,
			position: 6,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'CHARGRILLED CORN',
			description: 'With chipotle butter and coriander',
			price: 2.95,
			position: 7,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'BLUE CHEESE SLAW',
			description: 'Red cabbage, blue cheese sauce, red chilli, jalapenos',
			price: 3.25,
			position: 8,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, fries, {
			name: 'SIMPLE GREEN SALAD',
			description: 'Mixed leaves, toasted seeds, vinaigrette dressing',
			price: 1.55,
			position: 9,
			category: 'Vegetarian',
			image: 'default_image.jpg'})




puts 'Importing Restaurant::GBK::Sauces'
  	sauces = Menu.create(name: 'SAUCES', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 10)
		sauces.translate

		create_item(restaurant.id, sauces, {
			name: 'CHIPOTLE MAYO',
			description: '',
			price: 1.25 ,
			position: 1,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, sauces, {
			name: 'BACONNAISE',
			description: '',
			price: 1.25 ,
			position: 2,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, sauces, {
			name: 'BASIL PESTO MAYO',
			description: 'Contains nuts or nut oils',
			price: 1.25 ,
			position: 3,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, sauces, {
			name: 'SRIRACHA MAYO',
			description: '',
			price: 1.25 ,
			position: 4,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, sauces, {
			name: 'GARLIC MAYO',
			description: '',
			price: 1.25 ,
			position: 5,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

		create_item(restaurant.id, sauces, {
			name: 'BLUE CHEESE MAYO',
			description: '',
			price: 1.25 ,
			position: 6,
			category: 'Vegetarian',
			image: 'default_image.jpg'})

puts 'Importing Restaurant::GBK::Milkshakes'
  	milkshake = Menu.create(name: 'MILKSHAKES', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 11)
		milkshake.translate

		create_item(restaurant.id, milkshake, {
			name: 'MADAGASCAN VANILLA',
			description: '',
			price: 4.75,
			position: 1,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'DOUBLE BELGIAN CHOCOLATE',
			description: '',
			price: 4.75,
			position: 2,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'STRAWBERRY',
			description: '',
			price: 4.75,
			position: 3,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'BANANA',
			description: '',
			price: 4.75,
			position: 4,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'SEA-SALTED CARAMEL',
			description: '',
			price: 4.75,
			position: 5,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'OREO',
			description: '',
			price: 5.25,
			position: 6,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'PEANUT BUTTER',
			description: '',
			price: 5.25,
			position: 7,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, milkshake, {
			name: 'STRAWBERRY & OREO CHEESESHAKE',
			description: '',
			price: 4.90,
			position: 8,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})


puts 'Importing Restaurant::GBK::FreshFizzy'
  	fresh = Menu.create(name: 'FRESH & FIZZY', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 12)
		fresh.translate

		create_item(restaurant.id, fresh, {
			name: 'ELDERFLOWER',
			description: '',
			price: 2.70,
			position: 1,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, fresh, {
			name: 'GINGER & LEMONGRASS',
			description: '',
			price: 2.70,
			position: 2,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, fresh, {
			name: 'STRAWBERRY & ELDERFLOWER',
			description: '',
			price: 2.70,
			position: 3,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, fresh, {
			name: 'RHUBARB & VANILLA',
			description: '',
			price: 2.70,
			position: 4,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, fresh, {
			name: 'CLOUDY LEMONADE',
			description: '',
			price: 2.70,
			position: 5,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})



puts 'Importing Restaurant::GBK::Soft'
  	soft = Menu.create(name: 'SOFT DRINKS', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 13)
		soft.translate

		create_item(restaurant.id, soft, {
			name: 'ORANGE JUICE',
			description: '100% Fresh Juice',
			price: 3.00,
			position: 1,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'APPLE JUICE',
			description: '100% Fresh Juice',
			price: 3.00,
			position: 2,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'GINGERELLA GINGER ALE',
			description: '330ml',
			price: 3.00,
			position: 3,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'COCA-COLA',
			description: '330ml',
			price: 2.80,
			position: 4,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'DIET COKE',
			description: '330ml',
			price: 2.70,
			position: 5,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'COKE ZERO',
			description: '330ml',
			price: 2.70,
			position: 6,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'SPRITE',
			description: '330ml',
			price: 2.70,
			position: 7,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'STILL WATER',
			description: '500ml',
			price: 2.10,
			position: 8,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, soft, {
			name: 'SPARKLING WATER',
			description: '500ml',
			price: 2.10,
			position: 9,
			category: 'Non-Alcholic',
			image: 'default_image.jpg'})


# puts 'Importing Restaurant::GBK::Gluten'
#   	gluten = Menu.create(name: 'GLUTEN FREE', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 1)
# 		gluten.translate

		# create_item(restaurant.id, gluten, {
		# 	name: '',
		# 	description: '',
		# 	price: ,
		# 	position: 1,
		# 	category: '',
		# 	image: 'default_image.jpg'})

puts 'Importing Restaurant::GBK::BEER'
  	beer = Menu.create(name: 'BEER & CIDER', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 14)
		beer.translate

		create_item(restaurant.id, beer, {
			name: 'BUDVAR (330ML)',
			description: 'Czech premium lager (5.0%)',
			price: 4.15,
			position: 1,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, beer, {
			name: 'BUDVAR (500ML)',
			description: 'Czech premium lager (5.0%)',
			price: 6.05,
			position: 2,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, beer, {
			name: 'BREWDOG PUNK IPA 500ML',
			description: 'Classic pale, hoppy IPA (5.6%)',
			price: 6.25,
			position: 3,
			category: 'Alcoholic',
			image: 'default_image.jpg'})


		create_item(restaurant.id, beer, {
			name: 'DAURA DAMM',
			description: 'Pale, gluten free lager (5.4%)',
			price: 4.25,
			position: 4,
			category: 'Alcoholic',
			image: 'default_image.jpg'})


		create_item(restaurant.id, beer, {
			name: 'HOLLOWS GINGER BEER',
			description: 'All natural & gluten free (4.0%)',
			price: 5.65,
			position: 5,
			category: 'Alcoholic',
			image: 'default_image.jpg'})


		create_item(restaurant.id, beer, {
			name: 'OLD RASCAL CIDER',
			description: 'Medium dry Somerset cider (4.5%)',
			price: 5.35,
			position: 6,
			category: 'Alcoholic',
			image: 'default_image.jpg'})


		create_item(restaurant.id, beer, {
			name: 'THE WILD BEER CO. NEBULA',
			description: 'Hazy, tropical IPA (5%)',
			price: 4.95,
			position: 7,
			category: 'Alcoholic',
			image: 'default_image.jpg'})


		create_item(restaurant.id, beer, {
			name: 'TARAS BOULBA',
			description: 'Extra hoppy Belgian ale (4.5%)',
			price: 4.95,
			position: 8,
			category: 'Alcoholic',
			image: 'default_image.jpg'})






puts 'Importing Restaurant::GBK::Wine'
  	wine = Menu.create(name: 'WINES', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 15)
		wine.translate

		create_item(restaurant.id, wine, {
			name: 'GARGANEGA PINOT GRIGIO',
			description: 'Italy',
			price: 19.95,
			position: 1,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'SOUTH ISLAND SAUVIGNON BLANC',
			description: 'New Zeland',
			price: 19.95,
			position: 2,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'AFRIKAN RIDGE MERLOT',
			description: 'South Africa',
			price: 15.05,
			position: 3,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'TAPAS TEMPRANILLO',
			description: 'Spain',
			price: 16.95,
			position: 4,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'LA BONITA MALBEC',
			description: 'Argentina',
			price: 20.95,
			position: 5,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'AFRIKAN RIDGE CHENIN BLANK',
			description: 'South Africa',
			price: 15.05,
			position: 6,
			category: 'Alcoholic',
			image: 'default_image.jpg'})
		create_item(restaurant.id, wine, {
			name: 'VINOIR SYRAH ROSE',
			description: 'Chile',
			price: 19.95,
			position: 7,
			category: 'Alcoholic',
			image: 'default_image.jpg'})



puts 'Importing Restaurant::GBK::Cocktail'
  	cocktail = Menu.create(name: 'COCKTAIL COOLERS', parent: menu, restaurant_id: restaurant.id, node_type: 'section',position: 16)
		cocktail.translate

		create_item( restaurant.id, cocktail, {
			name: 'STRAWBERRY, ELDERFLOWER & GIN',
			description: '',
			price: 5.95,
			position: 1,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, cocktail, {
			name: 'RHUBARB, VANILLA & VODKA',
			description: '',
			price: 5.95,
			position: 2,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, cocktail, {
			name: 'GINGER, LEMONGRASS & GIN',
			description: '',
			price: 5.95,
			position: 3,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, cocktail, {
			name: 'ELDERFLOWER & VODKA',
			description: '',
			price: 5.95,
			position: 4,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, cocktail, {
			name: 'GIN & TONIC',
			description: 'Sipsmith London Dry Gin with tonic & lemon',
			price: 5.95,
			position: 5,
			category: 'Alcoholic',
			image: 'default_image.jpg'})

		create_item(restaurant.id, cocktail, {
			name: 'VODKA & GINGER ALE',
			description: 'Sipsmith Sipping Vodka with ginger ale & lime',
			price: 5.95,
			position: 6,
			category: 'Alcoholic',
			image: 'default_image.jpg'})






  end




end

