# frozen_string_literal: true

module Manager
  class RestaurantsController < Manager::BaseController
    before_action :authenticate_manager_restaurant_user!

    before_action :set_restaurant, only: %i[show edit update]
    before_action :set_cuisine, only: %i[new create show edit update]

    # GET /restaurants/new
    def new
      @restaurant = Restaurant.new
      @restaurant.restaurant_user_id = current_manager_restaurant_user.id
    end

    # GET /restaurants/1/edit
    def edit; end

    def show; end

    # POST /restaurants
    # POST /restaurants.json
    def create
      @restaurant = Restaurant.new(restaurant_params)

      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to manager_restaurant_path(@restaurant), notice: 'Restaurant was successfully created.' }
          format.json { render :show, status: :created, location: @restaurant }
        else
          format.html { render :new }
          format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /restaurants/1
    # PATCH/PUT /restaurants/1.json
    def update
      respond_to do |format|
        if @restaurant.update(restaurant_params)
          format.html { redirect_to manager_restaurant_path(@restaurant), notice: 'Restaurant was successfully updated.' }
          format.json { render :show, status: :ok, location: @restaurant }
        else
          format.html { render :edit }
          format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def set_cuisine
      @cuisines = Cuisine.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :postcode, :telephone, :email, :twitter, :facebook, :opening_times, :is_chain, :cuisine_id, :restaurant_user_id)
    end
  end
end
