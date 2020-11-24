FactoryBot.define do
  factory :restaurant do
		email { "test@test.com" }
    name { "Test name" }
    address { "Test address" }
    postcode { "Test postcode" }
    telephone { "Test telephone" }
    restaurant_user { FactoryBot.create(:restaurant_user) }
    cuisine { FactoryBot.create :cuisine }
  end
end
