class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :basket_total, :items, :email, :stripe_token, :status, :is_ready
  has_one :restaurant
end
