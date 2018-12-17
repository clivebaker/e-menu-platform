class Restaurant < ApplicationRecord
  belongs_to :cuisine

  belongs_to :restaurant_user

  has_many :menus
  has_many :restaurant_tables
  # has_many :tables, through: :restaurant_tables

  validates_presence_of :name, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :address, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :postcode, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :telephone, :on => [:create, :update], :message => "can't be blank"
  validates_presence_of :email, :on => [:create, :update], :message => "can't be blank"

  delegate :name, to: :cuisine, prefix: true
end
