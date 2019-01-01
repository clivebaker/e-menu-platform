class CustomList < ApplicationRecord
  belongs_to :restaurant
  has_many :custom_list_items
  validates_presence_of :name, :on => [:update,:create], :message => "can't be blank"
  validates_presence_of :constraint, :on => [:update,:create], :message => "can't be blank"




  def input_type
  
  	if constraint == '1'
  		'radio'
  	else
  		'checkbox'
  	end




  end

end
