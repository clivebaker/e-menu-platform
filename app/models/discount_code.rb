# frozen_string_literal: true

class DiscountCode < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant'
    
    scope :is_active?, -> { where("expires_on > ? OR created_at IS NULL", DateTime.now) }
    def self.types; ["PercentageOffBasketDiscountCode"]; end
    
    validates_presence_of :type, :code, :amount
    validates :code, :uniqueness => { constraint: is_active? }
    validates :code, length: { minimum: 3, maximum: 10 }
    validates :type, inclusion: { in: DiscountCode.types }

    def expiry_date; self.expires_on.presence || "Never"; end

    def is_active?
      self.expires_on > DateTime.now || self.expires_on.nil?
    end

    private
end
