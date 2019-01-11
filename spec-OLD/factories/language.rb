# frozen_string_literal: true

FactoryGirl.define do
  factory :language do
    name { Faker::Name.name }
    locale { Faker::Name.initials(2) }
    icon { Faker::Name.initials(2) }
    language_code { Faker::Name.initials(2) }
  end
end
