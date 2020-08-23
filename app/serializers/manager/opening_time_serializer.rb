class Manager::OpeningTimeSerializer < ActiveModel::Serializer
  attributes :id, :times
  has_one :restaurant
end
