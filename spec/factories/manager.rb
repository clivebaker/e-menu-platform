FactoryBot.define do
  factory :restaurant_user do
		sequence(:email) { "test@test.com" }
		password { "testtest" }
  end
end