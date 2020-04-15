class Manager::SettingSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :category
end
