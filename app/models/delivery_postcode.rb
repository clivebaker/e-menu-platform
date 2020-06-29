class DeliveryPostcode < ApplicationRecord
  belongs_to :restaurant
  before_save :up_prefix

  default_scope {order(prefix: :asc)}

  validates_uniqueness_of :prefix, scope: :restaurant_id, on: [:create, :update], message: "must be unique"

  validates_presence_of :prefix, on: [:create, :update], message: "can't be blank"
  validates_presence_of :delivery_fee, on: [:create, :update], message: "can't be blank"

  def up_prefix
    self.prefix = prefix.upcase
  end

end
