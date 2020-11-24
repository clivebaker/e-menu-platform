FactoryBot.define do
  factory :restaurant_user do
		email { "test@test.com" }
    password { "testtest" }
    
    trait :sign_up_redirect do
      redirect_after_signup_to { "/order/lulus" }
    end

    trait :invalid_email do
      email { "testtest.com" }
    end
  end
end