class RaspberryPiUpdateSerializer < ActiveModel::Serializer
  attributes :id, :version, :payload
end
