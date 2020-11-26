# frozen_string_literal: true

module Patrons
  class PatronsController < ApplicationController
    # layout 'order'

    def index
      @patrons = Patron.all
    end
  end
end
