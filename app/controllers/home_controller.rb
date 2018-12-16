class HomeController < ApplicationController


  def index
  	@restaurants = Restaurant.all
  end

  def register_table
  	@code = params[:code].upcase
  	@restaurant_table = RestaurantTable.find_by(code: @code)
    
    restaurant_table_id = cookies[:restaurant_table_id]
    table_id = cookies[:table_id]

    if table_id && @restaurant_table
      @table = Table.find_by(id: table_id, restaurant_table_id: @restaurant_table.id, aasm_state: :started) 
    end
# binding.pry
    respond_to do |format|
      if @table.present?
        format.html { redirect_to table_path(@table.id), notice: 'Table was successfully re-joined.' }
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


    # If no Live Tables
    if live_table.blank? 
      @table = Table.create(
                restaurant_table_id: @restaurant_table.id, 
                password: password)

      cookies[:restaurant_table_id] = {:value => @restaurant_table.id, :expires => 4.hour.from_now,}
      cookies[:table_id] = {:value => @table.id, :expires => 4.hour.from_now}

    else 
      @table = live_table.find_by(password: password)


      if @table.present?

        cookies[:restaurant_table_id] = {:value => @restaurant_table.id, :expires => 4.hour.from_now,}
        cookies[:table_id] = {:value => @table.id, :expires => 4.hour.from_now}

      end


    end

  #   cookies.delete(:key, :domain => 'domain.com')

      respond_to do |format|
      if @table.present?
        format.html { redirect_to table_path(@table.id), notice: 'Table was successfully started.' }
      else
        format.html { redirect_to register_table_path(@restaurant_table.code), alert: 'Cannot join table. Incorrect Password' }
      end
    end



  end



end
