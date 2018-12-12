class Table < ApplicationRecord
  
  include AASM
  belongs_to :restaurant_table


  delegate	:restaurant_id, :restaurant_name, to: :restaurant_table, prefix: false
  delegate	:code, :number, to: :restaurant_table, prefix: true



  aasm do
  	state :started, :initial => true
  end


end
