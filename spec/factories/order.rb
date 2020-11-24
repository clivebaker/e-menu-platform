FactoryBot.define do
  factory :order do
    patrons { build_list FactoryBot.build(:patron), 2 }
    restaurant { Restaurant.build(:restaurant) }
    value { 100 }
    currency { "GBP" }
  end
end