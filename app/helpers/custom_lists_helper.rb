module CustomListsHelper

	def constraint_to_human(constraint)
		case constraint
			when '*'
				t('menu.options_to_human.zero_more')
			when '1'
				t('menu.options_to_human.one')
			when '2'
				t('menu.options_to_human.two')
			when '3'
				t('menu.options_to_human.three')
		end			
	end



end
