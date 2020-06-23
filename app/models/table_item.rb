# frozen_string_literal: true

class TableItem < ApplicationRecord
 	
 	include AASM
  belongs_to :table
  belongs_to :menu

  delegate :name, :price_a, to: :menu, prefix: false, allow_nil: true


  delegate :restaurant_features, to: :table, prefix: true

	# validates :custom_lists, presence: true,  if: :volume_limits?
	validate :has_custom_options?

	def has_custom_options?

		menu.custom_lists.keys.each do |list|
			custom_list = CustomList.find(list)
			if custom_list.constraint !='*'
				if custom_lists[list].blank?
					errors.add(custom_list.name.to_sym, constraint_error_to_human(custom_list.constraint))
				elsif custom_lists[list].count != custom_list.constraint.to_i
					errors.add(custom_list.name.to_sym, constraint_error_to_human(custom_list.constraint))
				end
			end
		end
	end

	def total_price
		price_a + custom_list_prices
	end



	def custom_list_prices
		total = 0
			custom_lists.keys.each do |list_id|
			custom_lists[list_id].each do |list_item_id|
				custom_list_item = CustomListItem.find(list_item_id)
				total += custom_list_item.price if custom_list_item.price > 0
			end
		end
		total
	end



	def constraint_error_to_human(constraint)
		case constraint
			when '1'
				 '- please choose one option'
			when '2'
				 '- please choose two options'
			when '3'
				 '- please choose three options'
		end			
	end


  aasm do
    state :booked, initial: true
    state :ordered
    state :service
    state :paid
    state :ready

    event :order do
      transitions from: :booked, to: :ordered
	    after do
        if table_restaurant_features.map{|l| l.key}.include?('service')
        	self.service
      	end
      end

    end
    event :service do
      transitions from: :ordered, to: :service
    end
    event :paid do
      transitions from: :service, to: :paid
      # transitions from: :booked, to: :paid
      # transitions from: :prepare, to: :paid
    end

    event :finish do
      transitions from: :paid, to: :ready
      # transitions from: :booked, to: :paid
      # transitions from: :prepare, to: :paid
    end

  end




end
