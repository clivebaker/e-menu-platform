class Manager::SettingsController < Manager::BaseController
  before_action :authenticate_manager_restaurant_user!
  before_action :set_manager_setting, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource 
  # GET /manager/settings
  # GET /manager/settings.json
  def index

    @manager_settings = Setting.all
  end

  # GET /manager/settings/1
  # GET /manager/settings/1.json
  def show
  end

  # GET /manager/settings/new
  def new
    @manager_setting = Setting.new
  end

  # GET /manager/settings/1/edit
  def edit
  end

  # POST /manager/settings
  # POST /manager/settings.json
  def create
    @manager_setting = Setting.new(manager_setting_params)

    respond_to do |format|
      if @manager_setting.save
        format.html { redirect_to manager_settings_url, notice: 'Setting was successfully created.' }
        format.json { render :show, status: :created, location: @manager_setting }
      else
        format.html { render :new }
        format.json { render json: @manager_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/settings/1
  # PATCH/PUT /manager/settings/1.json
  def update
    respond_to do |format|
      if @manager_setting.update(manager_setting_params)
        format.html { redirect_to manager_settings_url, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_setting }
      else
        format.html { render :edit }
        format.json { render json: @manager_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/settings/1
  # DELETE /manager/settings/1.json
  def destroy
    @manager_setting.destroy
    respond_to do |format|
      format.html { redirect_to manager_settings_url, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_setting
      @manager_setting = Setting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manager_setting_params
      params.require(:manager_setting).permit(:name, :key, :category)
    end
end
