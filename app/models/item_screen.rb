class ItemScreen < ApplicationRecord
  belongs_to :item_screen_type
  belongs_to :restaurant
  belongs_to :printer, optional: true

  validates_uniqueness_of :item_screen_type_id, on: :create, message: "must be unique", scope: :restaurant_id

  delegate :name, :key, to: :item_screen_type, prefix: true
  delegate :name, to: :printer, prefix: true, allow_nil: true
end
