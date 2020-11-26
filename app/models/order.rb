# frozen_string_literal: true

class Order < ApplicationRecord
    has_and_belongs_to_many :patrons
    belongs_to :restaurant
 
end
