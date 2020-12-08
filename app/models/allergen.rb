# frozen_string_literal: true

class Allergen < ApplicationRecord
  has_many :patron_allergens
end
