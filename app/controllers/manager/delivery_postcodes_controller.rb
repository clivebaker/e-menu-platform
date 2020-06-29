module Manager


  class DeliveryPostcodesController < Manager::BaseController
    before_action :set_delivery_postcode, only: [:show, :edit, :update, :destroy]
    before_action :set_restaurant
    # GET /delivery_postcodes
    # GET /delivery_postcodes.json
    def index
      @delivery_postcodes = DeliveryPostcode.where(restaurant_id: @restaurant.id)
    end

    # GET /delivery_postcodes/1
    # GET /delivery_postcodes/1.json
    def show
    end

    # GET /delivery_postcodes/new
    def new
      @delivery_postcode = DeliveryPostcode.new
      @delivery_postcode.restaurant_id = @restaurant.id
    end

    # GET /delivery_postcodes/1/edit
    def edit
    end

    # POST /delivery_postcodes
    # POST /delivery_postcodes.json
    def create
      @delivery_postcode = DeliveryPostcode.new(delivery_postcode_params)

      respond_to do |format|
        if @delivery_postcode.save
          format.html { redirect_to manager_restaurant_delivery_postcodes_path(@restaurant.id), notice: 'Delivery postcode was successfully created.' }
          format.json { render :show, status: :created, location: @delivery_postcode }
        else
          format.html { render :new }
          format.json { render json: @delivery_postcode.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /delivery_postcodes/1
    # PATCH/PUT /delivery_postcodes/1.json
    def update
      respond_to do |format|
        if @delivery_postcode.update(delivery_postcode_params)
          format.html { redirect_to manager_restaurant_delivery_postcodes_path(@restaurant.id), notice: 'Delivery postcode was successfully updated.' }
          format.json { render :show, status: :ok, location: @delivery_postcode }
        else
          format.html { render :edit }
          format.json { render json: @delivery_postcode.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /delivery_postcodes/1
    # DELETE /delivery_postcodes/1.json
    def destroy
      @delivery_postcode.destroy
      respond_to do |format|
        format.html { redirect_to manager_restaurant_delivery_postcodes_path(@restaurant.id), notice: 'Delivery postcode was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_delivery_postcode
        @delivery_postcode = DeliveryPostcode.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def delivery_postcode_params
        params.require(:delivery_postcode).permit(:prefix, :delivery_fee, :restaurant_id)
      end
  end



end