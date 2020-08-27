class RaspberryPiUpdatesController < ApplicationController
  before_action :set_raspberry_pi_update, only: [:show, :edit, :update, :destroy]

  # GET /raspberry_pi_updates
  # GET /raspberry_pi_updates.json
  def index
    @raspberry_pi_updates = RaspberryPiUpdate.all
  end


  def ping
    render json: {ok: true}
  end
  

  # GET /raspberry_pi_updates/1
  # GET /raspberry_pi_updates/1.json
  def show
  end

  # GET /raspberry_pi_updates/new
  def new
    @raspberry_pi_update = RaspberryPiUpdate.new
  end

  # GET /raspberry_pi_updates/1/edit
  def edit
  end

  # POST /raspberry_pi_updates
  # POST /raspberry_pi_updates.json
  def create
    @raspberry_pi_update = RaspberryPiUpdate.new(raspberry_pi_update_params)

    respond_to do |format|
      if @raspberry_pi_update.save
        format.html { redirect_to @raspberry_pi_update, notice: 'Raspberry pi update was successfully created.' }
        format.json { render :show, status: :created, location: @raspberry_pi_update }
      else
        format.html { render :new }
        format.json { render json: @raspberry_pi_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raspberry_pi_updates/1
  # PATCH/PUT /raspberry_pi_updates/1.json
  def update
    respond_to do |format|
      if @raspberry_pi_update.update(raspberry_pi_update_params)
        format.html { redirect_to @raspberry_pi_update, notice: 'Raspberry pi update was successfully updated.' }
        format.json { render :show, status: :ok, location: @raspberry_pi_update }
      else
        format.html { render :edit }
        format.json { render json: @raspberry_pi_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raspberry_pi_updates/1
  # DELETE /raspberry_pi_updates/1.json
  def destroy
    @raspberry_pi_update.destroy
    respond_to do |format|
      format.html { redirect_to raspberry_pi_updates_url, notice: 'Raspberry pi update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raspberry_pi_update
      @raspberry_pi_update = RaspberryPiUpdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raspberry_pi_update_params
      params.require(:raspberry_pi_update).permit(:version, :payload)
    end
end
