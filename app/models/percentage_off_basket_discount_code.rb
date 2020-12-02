# frozen_string_literal: true

class PercentageOffBasketDiscountCode < DiscountCode
    validates :amount, numericality: { less_than_or_equal_to: 100 }
  
end
