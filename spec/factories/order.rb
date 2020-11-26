FactoryBot.define do
  factory :order do
    patrons { build_list :patron, 2 }
    restaurant { FactoryBot.build(:restaurant) }
    value { 100 }
    currency { "GBP" }
  end
end