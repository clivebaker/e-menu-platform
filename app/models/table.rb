class Table < ApplicationRecord
  include AASM
    belongs_to :restaurant
    before_create :set_unique_code

    validates_uniqueness_of :number, :on => :create, :message => "must be unique"
    validates_uniqueness_of :code, :on => :create, :message => "must be unique"




  aasm do
  	state :new, :initial => true
  end




  def set_unique_code
  	token_chars  = ('A'..'Z').to_a.delete_if{|i|i=='O'} + ('1'..'9').to_a
   	token_length = 6
 		self.code = Array.new(token_length) { token_chars[rand(token_chars.length)] }.join

  end


end
