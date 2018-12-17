class Table < ApplicationRecord
  include AASM
  belongs_to :restaurant_table

  delegate :restaurant, to: :restaurant_table, prefix: false
  delegate  :restaurant_id, :restaurant_name, to: :restaurant_table, prefix: false
  delegate  :code, :number, to: :restaurant_table, prefix: true

  has_many :table_items

  aasm do
    state :started, :initial => true
    state :finished

    event :finish do
      transitions :from => :started, :to => :finished
    end
  end
end
