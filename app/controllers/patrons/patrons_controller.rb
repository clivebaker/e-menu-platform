# frozen_string_literal: true

class PatronsController < ApplicationController
  # layout 'order'

  def index
    @patrons = Patron.all
  end
end
