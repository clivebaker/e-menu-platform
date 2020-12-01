# frozen_string_literal: true

class DiscountCode < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant'
    
    scope :is_active?, -> { where("created_at < ? OR created_at IS NULL", DateTime.now) }
    
    validates_presence_of :type, :code, :amount
    validates :code, :uniqueness => { constraint: is_active? }
    validates :code, length: { minimum: 3, maximum: 10 }

    def self.types; ["PercentageOffBasketDiscountCode"]; end

    def expiry_date; self.expires_on.presence || "Never"; end
end
