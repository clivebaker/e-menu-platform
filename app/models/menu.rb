# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :spice_level, optional: true

  after_save :clear_cache



def clear_cache
  # binding.pry
  Rails.cache.delete("api/restaurant/#{restaurant_id}/menu")
end

  # belongs_to :menu_item_categorisation, optional: true
  has_and_belongs_to_many :menu_item_categorisation
  has_and_belongs_to_many :cook_level

  has_ancestry

  has_one_attached :image

  translates :name, :description, fallbacks_for_empty_translations: true

  validates_presence_of :name, on: %i[update create], message: "can't be blank"
  # validates_presence_of :description, on: %i[update create], message: "can't be blank", if: :node?
  validates_presence_of :price_a, on: %i[update create], message: "can't be blank", if: :node?
  validates_numericality_of :price_a, on: :create, message: 'is not a number', if: :node?
  #   validates_numericality_of :price_b, :on => :create, :message => "is not a number", if: :node?

  delegate :name, to: :spice_level, prefix: true, allow_nil: true
  delegate :name, to: :cook_level, prefix: true, allow_nil: true
  delegate :features, to: :restaurant, prefix: true, allow_nil: true
  delegate :feature_ids, to: :restaurant, prefix: true, allow_nil: true
 
  delegate :id, to: :restaurant, prefix: true, allow_nil: false

  def node?
    node_type == 'item'
  end

  def prices_joined
    pri = []
    pri << price_a if price_a
    #      pri << price_b if price_b
    pri
  end

  def translate
    TranslateJob.perform_later self
  end
end
