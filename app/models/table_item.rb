# frozen_string_literal: true

class TableItem < ApplicationRecord
  belongs_to :table
  belongs_to :menu

  delegate :name, :price_a, to: :menu, prefix: false
end
