require 'rails_helper'

FactoryBot.define do
  factory :patron do
		sequence(:email) { "test@test.com" }
    
    trait :sign_in_redirect do
      redirect_after_signup_to { "/order/lulus" }
    end
    password { "testtest" }
    
    trait :with_password do
      password { "testtest" }
    end
  end
end