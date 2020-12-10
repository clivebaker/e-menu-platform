# frozen_string_literal: true

module Patrons
  class PatronAllergensController < ApplicationController
    before_action :authenticate_patron!
    # layout 'order'

    def update
      patron_allergen = current_patron.patron_allergens.where(:menu_item_categorisation_id => params[:id]).first_or_initialize
      patron_allergen.active = params[:active]
      
      respond_to do |format|
        if patron_allergen.save
          format.html { redirect_to settings_patrons_path, notice: "Success" }
        else
          format.html { redirect_to settings_patrons_path, alert: "Please try again" }
        end
      end   
    end
  end
end
