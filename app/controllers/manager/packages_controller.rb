class Manager::PackagesController < Manager::BaseController
   before_action :authenticate_manager_restaurant_user!
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_features, only: [:show]

  # GET /manager/packages
  # GET /manager/packages.json
  def index
    @packages = Package.all
  end

  # GET /manager/packages/1
  # GET /manager/packages/1.json
  def show
  end

  # GET /manager/packages/new
  def new
    @package = Package.new
  end

  # GET /manager/packages/1/edit
  def edit
  end

  def add_feature
    
    @package = Package.find(params[:package_id])
    feature = Feature.find(params[:feature_id])

    @package.features << feature

    redirect_to manager_package_path(@package)

  end

  def remove_feature
    
    
    @package = Package.find(params[:package_id])
    feature = Feature.find(params[:feature_id])

    @package.features.delete(feature)

    redirect_to manager_package_path(@package)



  end

  # POST /manager/packages
  # POST /manager/packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to manager_package_path(@package), notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/packages/1
  # PATCH/PUT /manager/packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to manager_package_path(@package), notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/packages/1
  # DELETE /manager/packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to manager_packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end
    def set_features
      @features = Feature.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name)
    end
end
