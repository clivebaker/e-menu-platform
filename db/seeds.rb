def add_item(restaurant, parent, name, description, price)
  item = Menu.create("restaurant" => restaurant, "available" => true, "node_type" => "item", "calories" => "344",
      "parent" => parent,
      # {}"menu_item_categorisation_ids"=>[ic1.id, ic2.id, ic12.id],
      # {}"spice_level_id"=>sl1.id,
       "name" => name,
       "description" => description,
       "price_a" => price, "price_b" => 0)
end

puts "Create User"
restaurant_user = RestaurantUser.create(email: 'clive@clivebaker.com', password: 'cliveb1', password_confirmation: 'cliveb1')

puts "Create Cuisines"
cuisine1 = Cuisine.create(name: 'Portuguese')
cuisine2 = Cuisine.create(name: 'Spanish')
cuisine3 = Cuisine.create(name: 'Italian')
cuisine4 = Cuisine.create(name: 'American')
cuisine5 = Cuisine.create(name: 'Turkish')
cuisine6 = Cuisine.create(name: 'Japanese')
cuisine7 = Cuisine.create(name: 'British')
cuisine8 = Cuisine.create(name: 'Indian')

puts "Create Categorisations"
ic1 = MenuItemCategorisation.create(name: 'Fish', icon: 'fi flaticon-fish')
ic2 = MenuItemCategorisation.create(name: 'Tofu', icon: 'fi flaticon-tofu')
ic3 = MenuItemCategorisation.create(name: 'Chicken', icon: 'fi flaticon-chicken-1')
ic4 = MenuItemCategorisation.create(name: 'Beef', icon: 'fi flaticon-cow')
ic5 = MenuItemCategorisation.create(name: 'Lamb', icon: 'fi flaticon-sheep-1')
ic6 = MenuItemCategorisation.create(name: 'Shellfish', icon: 'fi flaticon-shrimp')
ic7 = MenuItemCategorisation.create(name: 'Venison', icon: 'fi flaticon-deer')
ic8 = MenuItemCategorisation.create(name: 'Pork', icon: 'fi flaticon-pig-1')
ic9 = MenuItemCategorisation.create(name: 'Goat', icon: 'fi flaticon-goat')
ic10 = MenuItemCategorisation.create(name: 'Vegetarian', icon: 'fi flaticon-keyboard-key-v')
ic11 = MenuItemCategorisation.create(name: 'Halal', icon: 'fi flaticon-key-h-of-a-keyboard')
ic12 = MenuItemCategorisation.create(name: 'Kosher', icon: 'fi flaticon-keyboard-key-k')

puts "Create Spices"
sl1 = SpiceLevel.create(name: 'None', icon: 'fi fi-none')
sl2 = SpiceLevel.create(name: 'Extra Mild', icon: 'fi fi-chilli1')
sl3 = SpiceLevel.create(name: 'Mild', icon: 'fi fi-chilli2')
sl4 = SpiceLevel.create(name: 'Medium', icon: 'fi fi-chilli3')
sl5 = SpiceLevel.create(name: 'Hot', icon: 'fi fi-chilli4')
sl6 = SpiceLevel.create(name: 'Extra Hot', icon: 'fi fi-chilli5')

puts "Create Languages"
language2 = Language.create(name: 'Catalan', locale: 'ca', language_code: 'ca', icon: '')
language4 = Language.create(name: 'Danish', locale: 'da-DK', language_code: 'da', icon: '')
language5 = Language.create(name: 'German', locale: 'de', language_code: 'de', icon: '')
language7 = Language.create(name: 'English', locale: 'en', language_code: 'en', icon: '')
language8 = Language.create(name: 'Spanish', locale: 'es', language_code: 'es', icon: '')
language11 = Language.create(name: 'French', locale: 'fr', language_code: 'fr', icon: '')
language13 = Language.create(name: 'Italian', locale: 'it', language_code: 'it', icon: '')
language15 = Language.create(name: 'Latvian', locale: 'lv', language_code: 'lv', icon: '')
language17 = Language.create(name: 'Dutch', locale: 'nl', language_code: 'nl', icon: '')
language18 = Language.create(name: 'Norwegian', locale: 'no-NO', language_code: 'no', icon: '')
language19 = Language.create(name: 'Portuguese', locale: 'pt', language_code: 'pt', icon: '')
language20 = Language.create(name: 'Russian', locale: 'ru', language_code: 'ru', icon: '')
language21 = Language.create(name: 'Slovakian', locale: 'sk', language_code: 'sk', icon: '')
language24 = Language.create(name: 'Swedish', locale: 'sv', language_code: 'sv', icon: '')

puts "Create Restaurant"
# restaurant = Restaurant.create(name: 'Nandos', restaurant_user: restaurant_user, cuisine: cuisine1, address: "66 Meadowgroft, St Albans", postcode: "AL1 1UF", telephone: '07900 987 482', email: 'menu@nandos.co.uk')

puts "Create Menu"
# menu = Menu.create("restaurant"=>restaurant, "name"=>"Main Menu", "node_type"=>"menu")
# category = Menu.create("restaurant"=>restaurant, "name"=>"Category", "node_type"=>"section", "parent"=>menu)
# item = Menu.create("restaurant"=>restaurant, "name"=>"Clive", "description"=>"hjhjhj", "menu_item_categorisation_ids"=>[ic1.id, ic2.id, ic12.id], "spice_level_id"=>sl1.id, "price_a"=>"12.34", "price_b"=>"6.18", "available"=>true, "calories"=>"344", "node_type"=>"item", "parent"=>category)

puts "Translate"
Menu.all.each do |m|
#  m.translate
end

menu = Menu.create("restaurant" => restaurant, "name" => "Main Menu", "node_type" => "menu")
starters = Menu.create("restaurant" => restaurant, "node_type" => "section", "parent" => menu, "name" => "Fire-Starters")

add_item(restaurant, starters, '3 Chicken Wings', 'Curb your craving with a PERi-PERi taster.', 3.70)
add_item(restaurant, starters, 'Houmous with PERi-PERi Drizzle', 'Pour smoky PERi-PERi oil over creamy houmous and dig in with strips of warm pitta.', 3.70)
add_item(restaurant, starters, 'Red Pepper Dip', 'Dive in to roasted red pepper and chilli spice dip with warm pitta strips.', 3.70)
add_item(restaurant, starters, 'Spicy Mixed Olives', 'Co-starring mushrooms, garlic and red pepper', 3.70)
add_item(restaurant, starters, 'PERi-PERi Nuts', 'Fiery almonds, cashews and macadamias - crunch with punch.', 3.70)
add_item(restaurant, starters, 'Halloumi Sticks & Dip', 'Five chunky sticks of grilled halloumi cheese with a chilli jam dip.', 3.70)

starters_share = Menu.create("restaurant" => restaurant, "node_type" => "section", "parent" => starters, "name" => "To Share")

add_item(restaurant, starters_share, 'All Together Now', 'Please everyone! Split any three Fire-Starters. For 2-4 people to share. Excludes Wing Roulette.', 9.95)
add_item(restaurant, starters_share, 'Wing Roulette', '10 wings randomly spiced in various PERi-PERi flavours. Live dangerously.', 10.95)
