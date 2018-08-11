class Restaurant < ApplicationRecord
  belongs_to :cuisine
  
  has_many :menus

  validates_presence_of :name, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :address, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :postcode, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :telephone, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :email, :on => [:create, :update], :message => "can't be blank"


   delegate :name, to: :cuisine, prefix: true
end
