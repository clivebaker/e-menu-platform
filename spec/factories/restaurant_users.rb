
FactoryGirl.define do
  factory :restaurant_user do
    sequence(:email) {|n| "user#{n}@e-me.nu"}
    password "password1"
    password_confirmation "password1"

    # other devise related stuff, like confirmed_at
  end
end