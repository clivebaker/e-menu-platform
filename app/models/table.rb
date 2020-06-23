# frozen_string_literal: true

class Table < ApplicationRecord
  include AASM
  belongs_to :restaurant_table

  delegate :restaurant, to: :restaurant_table, prefix: false
  delegate  :restaurant_id, :restaurant_name, to: :restaurant_table, prefix: false
  delegate  :code, :number, to: :restaurant_table, prefix: true
  delegate  :features, to: :restaurant, prefix: true

  scope :live, -> { where(aasm_state: 'started') }

  def has_live_items?
    live_items.count > 0
  end

  def live_items
    table_items.where(aasm_state: ['ordered', 'service', 'paid']) #select{|e| e.ordered?}
  end
  def all_ready
    items = table_items.where.not(aasm_state: 'ready')
    items.blank?
  end


  def current_total
    table_items.reject{|a| a.paid?}.reject{|a| a.ready?}.map{|e| e.price_a || 0}.inject(:+) || 0
  end

  def total
    table_items.map{|e| e.price_a || 0}.inject(:+) || 0
  end

  has_many :table_items

  aasm do
    state :started, initial: true
    state :finished

    event :finish do
      transitions from: :started, to: :finished
    end
  end
end
