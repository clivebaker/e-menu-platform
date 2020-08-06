class Manager::ItemScreenTypesController  < Manager::BaseController
  before_action :set_item_screen_type, only: [:show, :edit, :update, :destroy]

  # GET /item_screen_types
  # GET /item_screen_types.json
  def index
    @item_screen_types = ItemScreenType.all
  end

  # GET /item_screen_types/1
  # GET /item_screen_types/1.json
  def show
  end

  # GET /item_screen_types/new
  def new
    @item_screen_type = ItemScreenType.new
  end

  # GET /item_screen_types/1/edit
  def edit
  end

  # POST /item_screen_types
  # POST /item_screen_types.json
  def create
    @item_screen_type = ItemScreenType.new(item_screen_type_params)

    respond_to do |format|
      if @item_screen_type.save
        format.html { redirect_to @item_screen_type, notice: 'Item screen type was successfully created.' }
        format.json { render :show, status: :created, location: @item_screen_type }
      else
        format.html { render :new }
        format.json { render json: @item_screen_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_screen_types/1
  # PATCH/PUT /item_screen_types/1.json
  def update
    respond_to do |format|
      if @item_screen_type.update(item_screen_type_params)
        format.html { redirect_to @item_screen_type, notice: 'Item screen type was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_screen_type }
      else
        format.html { render :edit }
        format.json { render json: @item_screen_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_screen_types/1
  # DELETE /item_screen_types/1.json
  def destroy
    @item_screen_type.destroy
    respond_to do |format|
      format.html { redirect_to item_screen_types_url, notice: 'Item screen type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_screen_type
      @item_screen_type = ItemScreenType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_screen_type_params
      params.require(:item_screen_type).permit(:name)
    end
end
