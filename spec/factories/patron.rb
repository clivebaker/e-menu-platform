FactoryBot.define do
  factory :patron do
		sequence(:email) { "test@test.com" }
		password { "testtest" }
  end
end