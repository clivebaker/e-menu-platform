# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def register_table
    @code = params[:code].upcase
    @restaurant_table = RestaurantTable.find_by(code: @code)
    table_id = cookies[:table_id]
    @table = Table.find_by(id: table_id, restaurant_table_id: @restaurant_table.id, aasm_state: :started) if table_id && @restaurant_table
    respond_to do |format|
      if @table.present?

        if @table.restaurant_features.map{|s| s.key.to_sym}.include?("menu_in_sections".to_sym)
          format.html { redirect_to table_sectioned_menus_path(@table), notice: t('messages.table_joined_successfully') }
        else
          format.html { redirect_to table_path(@table.id), notice: t('messages.table_joined_successfully') }
        end

      else
        format.html
      end
    end
  end

 

  def set_locale
    language = Language.find(params[:language_id])
    cookies[:locale] = language.locale
    cookies[:language] = language.name
    redirect_back(fallback_location: home_index_path)
  end

  def start_table
    table_id = params[:table_id]
    @restaurant_table = RestaurantTable.find(table_id)
    password = params[:password].downcase
    live_table = @restaurant_table.tables.where(aasm_state: :started)
    if live_table.blank?
      @table = Table.create(
        restaurant_table_id: @restaurant_table.id,
        password: password
      )
      cookies[:restaurant_table_id] = { value: @restaurant_table.id, expires: 4.hour.from_now }
      cookies[:table_id] = { value: @table.id, expires: 4.hour.from_now }
    else
      @table = live_table.find_by(password: password)
      if @table.present?
        cookies[:restaurant_table_id] = { value: @restaurant_table.id, expires: 4.hour.from_now }
        cookies[:table_id] = { value: @table.id, expires: 4.hour.from_now }
      end
    end
    respond_to do |format|
      if @table.present?

        # binding.pry

        if @table.restaurant_features.map{|s| s.key.to_sym}.include?("menu_in_sections".to_sym)
          format.html { redirect_to table_sectioned_menus_path(@table), notice: t('messages.table_created_successfully') }
        else
          format.html { redirect_to table_path(@table.id), notice: t('messages.table_created_successfully') }
        end

      else
        format.html { redirect_to register_table_path(@restaurant_table.code), alert: t('messages.table_incorrect_password') }
      end
    end
  end
end
