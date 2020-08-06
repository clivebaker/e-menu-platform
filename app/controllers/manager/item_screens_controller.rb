class Manager::ItemScreensController  < Manager::BaseController
  before_action :set_item_screen, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  before_action :set_item_screen_types
  before_action :set_printers

  # GET /item_screens
  # GET /item_screens.json
  def index
    @item_screens = ItemScreen.where(restaurant_id: @restaurant.id)
  end

  # GET /item_screens/1
  # GET /item_screens/1.json
  def show
  end

  # GET /item_screens/new
  def new
    @item_screen = ItemScreen.new
    @item_screen.restaurant_id     = @restaurant.id    
  end

  # GET /item_screens/1/edit
  def edit
  end

  # POST /item_screens
  # POST /item_screens.json
  def create
    @item_screen = ItemScreen.new(item_screen_params)

    respond_to do |format|
      if @item_screen.save
        format.html { redirect_to manager_restaurant_item_screens_path(@restaurant), notice: 'Item screen was successfully created.' }
        format.json { render :show, status: :created, location: @item_screen }
      else
        format.html { render :new }
        format.json { render json: @item_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_screens/1
  # PATCH/PUT /item_screens/1.json
  def update
    respond_to do |format|
      if @item_screen.update(item_screen_params)
        format.html { redirect_to manager_restaurant_item_screens_path(@restaurant), notice: 'Item screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_screen }
      else
        format.html { render :edit }
        format.json { render json: @item_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_screens/1
  # DELETE /item_screens/1.json
  def destroy
    @item_screen.destroy
    respond_to do |format|
      format.html { redirect_to manager_restaurant_item_screens_path(@restaurant), notice: 'Item screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_screen
      @item_screen = ItemScreen.find(params[:id])
    end


    def set_item_screen_types
      @item_screen_types = ItemScreenType.all
    end
    def set_printers
      @printers = Printer.where(restaurant_id: @restaurant.id)
    end
    
    
    
      # Only allow a list of trusted parameters through.
    def item_screen_params
      params.require(:item_screen).permit(:item_screen_type_id, :restaurant_id, :printer_id, :on_new, :buzz_on_new)
    end
end
