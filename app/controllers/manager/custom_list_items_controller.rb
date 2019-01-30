# frozen_string_literal: true

module Manager

class CustomListItemsController < Manager::BaseController
   before_action :authenticate_manager_restaurant_user!
  before_action :set_custom_list_item, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  before_action :set_custom_list
  # GET /custom_list_items
  # GET /custom_list_items.json
  def index
    @custom_list_items = CustomListItem.all
  end

  # GET /custom_list_items/1
  # GET /custom_list_items/1.json
  def show
  end

  # GET /custom_list_items/new
  def new
    @custom_list_item = CustomListItem.new
  end

  # GET /custom_list_items/1/edit
  def edit
  end

  # POST /custom_list_items
  # POST /custom_list_items.json
  def create
    @custom_list_item = CustomListItem.new(custom_list_item_params)

    respond_to do |format|
      if @custom_list_item.save
        format.html { redirect_to manager_restaurant_custom_list_path(@restaurant, @custom_list), notice: 'Custom list item was successfully created.' }
        format.json { render :show, status: :created, location: @custom_list_item }
      else
        format.html { render :new }
        format.json { render json: @custom_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_list_items/1
  # PATCH/PUT /custom_list_items/1.json
  def update
    respond_to do |format|
      if @custom_list_item.update(custom_list_item_params)
        format.html { redirect_to manager_restaurant_custom_list_path(@restaurant, @custom_list), notice: 'Custom list item was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_list_item }
      else
        format.html { render :edit }
        format.json { render json: @custom_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_list_items/1
  # DELETE /custom_list_items/1.json
  def destroy
    @custom_list_item.destroy
    respond_to do |format|
      format.html { redirect_to manager_restaurant_custom_list_path(@restaurant, @custom_list), notice: 'Custom list item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_list_item
      @custom_list_item = CustomListItem.find(params[:id])
    end
    def set_custom_list
      @custom_list = CustomList.find(params[:custom_list_id])
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_list_item_params
      params.require(:custom_list_item).permit(:name, :custom_list_id, :price, :description)
    end
end


end
