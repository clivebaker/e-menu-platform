class CustomListItem < ApplicationRecord
  belongs_to :custom_list

    validates_presence_of :price, :on => [:create, :update], :message => "please include a price or 0 for no price"
    delegate :name, to: :custom_list, prefix: true
end
