class MenusController < ApplicationController
  before_action :authenticate_restaurant_user!
  before_action :set_spice_levels, only: [:new, :create,  :edit, :update]
  before_action :set_menu_item_categorisations, only: [:new, :create,  :edit, :update]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
   
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

          redirect_location = @menu.node_type == 'item' ? restaurant_menu_path(@restaurant, @menu) : restaurant_menus_path(@restaurant)
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
          redirect_location = @menu.node_type == 'item' ? restaurant_menu_path(@restaurant, @menu) : restaurant_menus_path(@restaurant)

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
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully destroyed.' }
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
      params.require(:menu).permit(:restaurant_id, :name, :description, :image, :spice_level_id, :node_type, :menu_item_categorisation_id, :prices, :available, :calories)
    end
end
