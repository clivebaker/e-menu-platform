class Feature < ApplicationRecord
	has_and_belongs_to_many :packages
	has_and_belongs_to_many :restaurants


	
	
end
