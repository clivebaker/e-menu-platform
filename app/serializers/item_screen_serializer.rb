class ItemScreenSerializer < ActiveModel::Serializer
  attributes :id, :on_new
  has_one :item_screen_type
  has_one :restaurant
  has_one :printer
end
