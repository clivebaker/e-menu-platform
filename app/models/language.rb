# frozen_string_literal: true

class Language < ApplicationRecord
  default_scope { order('name ASC') }
	validates_presence_of :name, :icon, :locale, :language_code

end
