# frozen_string_literal: true

json.array! @restaurant_tables, partial: 'mamager/tables/restaurant_table', as: :table
