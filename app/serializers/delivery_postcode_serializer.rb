class DeliveryPostcodeSerializer < ActiveModel::Serializer
  attributes :id, :prefix, :delivery_fee
  has_one :restaurant
end
