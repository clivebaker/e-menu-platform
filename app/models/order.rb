# frozen_string_literal: true

class Order < ApplicationRecord
    has_many :patrons
    belongs_to :restaurant

    
end
