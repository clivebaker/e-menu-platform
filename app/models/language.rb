# frozen_string_literal: true

class Language < ApplicationRecord
  default_scope { order('name ASC') }
end
