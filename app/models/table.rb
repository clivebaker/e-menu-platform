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
    table_items.where(aasm_state: 'ordered') #select{|e| e.ordered?}
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
