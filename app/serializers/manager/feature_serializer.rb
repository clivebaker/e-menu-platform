class Manager::FeatureSerializer < ActiveModel::Serializer
  attributes :id, :name, :key
end
