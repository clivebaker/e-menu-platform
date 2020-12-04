# frozen_string_literal: true

class DiscountCode < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant'
    
    scope :is_active?, -> { where("expires_on > ? OR expires_on IS NULL", DateTime.now) }
    def self.types; ["PercentageOffBasketDiscountCode"]; end
    
    validates_presence_of :type, :code, :amount
    validates :code, format: { with: /\A[a-zA-Z0-9]+\Z/ }

    validates :code, :uniqueness => { constraint: is_active? }
    validates :code, length: { minimum: 3, maximum: 10 }
    validates :type, inclusion: { in: DiscountCode.types }

    def expiry_date; self.expires_on.present? ? self.expires_on.strftime("%Y-%m-%d") : "Never"; end

    def is_active?
      self.expires_on.nil? || self.expires_on > DateTime.now
    end

    private
end
