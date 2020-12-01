class Patrons::PatronAllergen < ApplicationRecord
  belongs_to :allergen
  belongs_to :patron

  
end
