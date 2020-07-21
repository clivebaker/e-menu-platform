# frozen_string_literal: true

class Restaurant < ApplicationRecord
  belongs_to :cuisine

  belongs_to :restaurant_user

  has_many :delivery_postcodes
  has_many :receipts
  has_many :menus
  has_many :restaurant_tables
  has_many :custom_lists, -> { order(position: :asc) }
  has_and_belongs_to_many :features
  has_and_belongs_to_many :template

  # has_many :tables, through: :restaurant_tables

  validates_presence_of :name, on: %i[create update], message: "can't be blank"
  validates_presence_of :address, on: %i[create update], message: "can't be blank"
  validates_presence_of :postcode, on: %i[create update], message: "can't be blank"
  validates_presence_of :telephone, on: %i[create update], message: "can't be blank"
  validates_presence_of :email, on: %i[create update], message: "can't be blank"
  validates_uniqueness_of :path, on: %i[create update], message: "must be unique"
  validates_uniqueness_of :restaurant_user_id, on: %i[create update], message: "must be unique"

  delegate :name, to: :cuisine, prefix: true
  delegate :ids, to: :features, prefix: true


  before_create :set_slug

  has_one_attached :image


  def set_slug
    
    if slug.blank? 

      token_chars = ('A'..'Z').to_a.delete_if { |i| i == 'O' } + ('1'..'9').to_a
      token_length = 6
      self.slug = Array.new(token_length) { token_chars[rand(token_chars.length)] }.join
      
    end


  end



end
