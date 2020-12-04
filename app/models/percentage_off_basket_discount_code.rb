# frozen_string_literal: true

class PercentageOffBasketDiscountCode < DiscountCode
  validates :amount, numericality: { more_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def apply_discount_to_total(total)
    total * ((100 - self.amount)/100.0)
  end

  def description
    "#{self.amount}% discount"
  end
end
