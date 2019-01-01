module CustomListsHelper

	def constraint_to_human(constraint)
		case constraint
			when '*'
				"Optional (Zero or more)"
			when '1'
				"Require one only"
			when '2'
				"Require two only"
			when '3'
				"Require three only"
		end			
	end



end
