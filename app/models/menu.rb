class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :spice_level, optional: true
  belongs_to :menu_item_categorisation, optional: true

	has_ancestry
  

  validates_presence_of :name, :on => [:update, :create], :message => "can't be blank"


   delegate :name, to: :spice_level, prefix: true, allow_nil:true
   delegate :name, to: :menu_item_categorisation, prefix: true, allow_nil:true

end
