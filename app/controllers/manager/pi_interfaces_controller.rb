class Manager::PiInterfacesController < Manager::BaseController
  before_action :authenticate_manager_restaurant_user!
  before_action :set_pi_interface, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  
  # GET /pi_interfaces
  # GET /pi_interfaces.json
  def index
    @pi_interfaces = PiInterface.where(restaurant_id: @restaurant.id)
  end

  # GET /pi_interfaces/1
  # GET /pi_interfaces/1.json
  def show
  end

  # GET /pi_interfaces/new
  def new
    @pi_interface = PiInterface.new
  end

  # GET /pi_interfaces/1/edit
  def edit
  end

  # POST /pi_interfaces
  # POST /pi_interfaces.json
  def create
    @pi_interface = PiInterface.new(pi_interface_params)

    respond_to do |format|
      if @pi_interface.save
        format.html { redirect_to @pi_interface, notice: 'Pi interface was successfully created.' }
        format.json { render :show, status: :created, location: @pi_interface }
      else
        format.html { render :new }
        format.json { render json: @pi_interface.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pi_interfaces/1
  # PATCH/PUT /pi_interfaces/1.json
  def update
    respond_to do |format|
      if @pi_interface.update(pi_interface_params)
        format.html { redirect_to @pi_interface, notice: 'Pi interface was successfully updated.' }
        format.json { render :show, status: :ok, location: @pi_interface }
      else
        format.html { render :edit }
        format.json { render json: @pi_interface.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pi_interfaces/1
  # DELETE /pi_interfaces/1.json
  def destroy
    @pi_interface.destroy
    respond_to do |format|
      format.html { redirect_to manager_restaurant_pi_interfaces_path(@restaurant), notice: 'Pi interface was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def request_lsusb

    pi_interface = PiInterface.find(params[:pi_interface_id])

    pi_interface.request_lsusb
    respond_to do |format|
      format.html { redirect_to manager_restaurant_pi_interface_path(@restaurant, pi_interface), notice: 'Pi LSUSB requested' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pi_interface
      @pi_interface = PiInterface.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pi_interface_params
      params.require(:pi_interface).permit(:server_token, :references)
    end
end
