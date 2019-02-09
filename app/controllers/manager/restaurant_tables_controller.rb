# frozen_string_literal: true

module Manager
  class RestaurantTablesController < Manager::BaseController
    before_action :set_restaurant_table, only: %i[show edit update destroy]
    before_action :authenticate_manager_restaurant_user!
    before_action :set_restaurant
    # GET /restaurant_tables
    # GET /restaurant_tables.json
    def index
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
    end

    def qr
      @restaurant_tables = RestaurantTable.where(restaurant_id: @restaurant.id).order(:number)
    end




    # GET /restaurant_tables/1
    # GET /restaurant_tables/1.json
    def show
      restaurant_table_id = cookies[:restaurant_table_id]
      redirect_to home_index_path, alert: 'The restaurant_table session has expired. Please re-join restaurant_table.' unless @restaurant_table.id == restaurant_table_id.to_i
    end

    # GET /restaurant_tables/new
    def new
      @restaurant_table = RestaurantTable.new
      @restaurant_table.restaurant_id = @restaurant.id
    end

    # GET /restaurant_tables/1/edit
    def edit; end

    # POST /restaurant_tables
    # POST /restaurant_tables.json
    def create
      @restaurant_table = RestaurantTable.new(restaurant_table_params)

      respond_to do |format|
        if @restaurant_table.save
          format.html { redirect_to manager_restaurant_restaurant_tables_path(@restaurant), notice: 'restaurant_Table was successfully created.' }
          format.json { render :show, status: :created, location: @restaurant_table }
        else
          format.html { render :new }
          format.json { render json: @restaurant_table.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /restaurant_tables/1
    # PATCH/PUT /restaurant_tables/1.json
    def update
      respond_to do |format|
        if @restaurant_table.update(restaurant_table_params)
          format.html { redirect_to manager_restaurant_restaurant_tables_path(@restaurant), notice: 'restaurant_Table was successfully updated.' }
          format.json { render :show, status: :ok, location: @restaurant_table }
        else
          format.html { render :edit }
          format.json { render json: @restaurant_table.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /restaurant_tables/1
    # DELETE /restaurant_tables/1.json
    def destroy
      @restaurant_table.destroy
      respond_to do |format|
        format.html { redirect_to manager_restaurant_restaurant_tables_path(@restaurant), notice: 'restaurant_Table was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_table
      @restaurant_table = RestaurantTable.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_table_params
      params.require(:restaurant_table).permit(:restaurant_id, :number, :aasm_state, :number_seats)
    end
  end
end
