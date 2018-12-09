class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :spice_level, optional: true
  # belongs_to :menu_item_categorisation, optional: true
	has_and_belongs_to_many :menu_item_categorisation
	has_ancestry
  
  translates :name, :description, :fallbacks_for_empty_translations => true

  
  validates_presence_of :name, :on => [:update, :create], :message => "can't be blank"
  validates_presence_of :description, :on => [:update, :create], :message => "can't be blank", if: :is_node?
  validates_presence_of :price_a, :on => [:update, :create], :message => "can't be blank", if: :is_node?
  validates_numericality_of :price_a, :on => :create, :message => "is not a number", if: :is_node? 
# 	validates_numericality_of :price_b, :on => :create, :message => "is not a number", if: :is_node?


   delegate :name, to: :spice_level, prefix: true, allow_nil:true
    
   delegate :id, to: :restaurant, prefix: true, allow_nil:false

   def is_node?
   	node_type == 'item'
   end


		def prices_joined
			pri = []
			pri << price_a if price_a
#			pri << price_b if price_b
			pri
		end


    def translate
      TranslateJob.perform_later self
    end


#Yandex Translation
# https://translate.yandex.net/api/v1.5/tr/translate
#  ? key=<API key>
#  & text=<text to translate>
#  & lang=<translation direction>
#  & [format=<text format>]
#  & [options=<translation options>]

#“Translated by Yandex.Translate” 

end
