# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Cuisine.create(name: 'Portuguese')
Cuisine.create(name: 'Spanish')
Cuisine.create(name: 'Italian')
Cuisine.create(name: 'American')
Cuisine.create(name: 'Turkish')
Cuisine.create(name: 'Japanese')
Cuisine.create(name: 'British')
Cuisine.create(name: 'Indian')


MenuItemCategorisation.create(name: 'Vegetarian')
MenuItemCategorisation.create(name: 'Chicken')
MenuItemCategorisation.create(name: 'Chicken (kosher)')
MenuItemCategorisation.create(name: 'Chicken (halal)')
MenuItemCategorisation.create(name: 'Beef')
MenuItemCategorisation.create(name: 'Beef (kosher)')
MenuItemCategorisation.create(name: 'Beef (halal)')
MenuItemCategorisation.create(name: 'Lamb')
MenuItemCategorisation.create(name: 'Pork')
MenuItemCategorisation.create(name: 'Fish')
MenuItemCategorisation.create(name: 'Shellfish')
MenuItemCategorisation.create(name: 'Tofu')
MenuItemCategorisation.create(name: 'Quorn')
MenuItemCategorisation.create(name: 'Venison')

SpiceLevel.create(name: 'None', description: 'No spice level')
SpiceLevel.create(name: 'Extra Mild', description: 'Very low levels of heat')
SpiceLevel.create(name: 'Mild', description: '1 Chilli heat')
SpiceLevel.create(name: 'Medium', description: '2 Chilli heat')
SpiceLevel.create(name: 'Hot', description: '3 Chilli heat')
SpiceLevel.create(name: 'Extra Hot', description: '4 Chilli heat')