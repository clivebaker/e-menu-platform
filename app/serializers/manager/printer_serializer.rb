class Manager::PrinterSerializer < ActiveModel::Serializer
  attributes :id, :name, :vendor, :product
  has_one :pi_interface
end
