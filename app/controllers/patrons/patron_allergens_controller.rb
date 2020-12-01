# frozen_string_literal: true

module Patrons
  class PatronAllergensController < ApplicationController
    before_action :authenticate_patron!
    # layout 'order'

    def update
      cp = current_patron.patron_allergens.where(:allergen_id => params[:id]).first_or_initialize
      cp.active = params[:active]
      
      respond_to do |format|
        if cp.save
          format.html { redirect_to settings_patrons_path, alert: "Success" }
        else
          format.html { redirect_to settings_patrons_path, alert: "Please try again" }
        end
      end   
    end
  end
end
