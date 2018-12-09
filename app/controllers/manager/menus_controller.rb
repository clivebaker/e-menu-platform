module Manager
class MenusController < Manager::BaseController
  before_action :authenticate_manager_restaurant_user!
  before_action :set_spice_levels, only: [:new, :create,  :edit, :update]
  before_action :set_menu_item_categorisations, only: [:new, :create,  :edit, :update]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.where(ancestry: nil)
    @updated_menu = params[:updated_menu].to_i if params[:updated_menu]
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.parent = Menu.find(params[:parent]) if params[:parent].present?

    respond_to do |format|
      if @menu.save

        @menu.translate
        redirect_location = @menu.node_type == 'item' ? manager_restaurant_menu_path(@restaurant, @menu, updated_menu: @menu.id) : manager_restaurant_menus_path(@restaurant, updated_menu: @menu.id)
        format.html { redirect_to redirect_location, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update

    respond_to do |format|
      if @menu.update(menu_params)
        
        @menu.translate
        redirect_location = @menu.node_type == 'item' ? manager_restaurant_menu_path(@restaurant, @menu, updated_menu: @menu.id) : manager_restaurant_menus_path(@restaurant, updated_menu: @menu.id)

        format.html { redirect_to redirect_location, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    parent_id = @menu.parent.present? ? @menu.parent.id : nil
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to manager_restaurant_menus_path(@restaurant, updated_menu: parent_id), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_menu
      @menu = Menu.find(params[:id])
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_spice_levels
      @spice_levels = SpiceLevel.all
    end
    def set_menu_item_categorisations
      @menu_item_categorisations = MenuItemCategorisation.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:restaurant_id, :name, :description, :image, :spice_level_id, :node_type,  :prices, :available, :calories, :price_a, :price_b, :menu_item_categorisation_ids => [])
    end
end
end
