class Language < ApplicationRecord

	default_scope {order('name ASC')}

end
