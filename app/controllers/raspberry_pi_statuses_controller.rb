class RaspberryPiStatusesController < ApplicationController
  before_action :set_raspberry_pi_status, only: [:show, :edit, :update, :destroy]

  # GET /raspberry_pi_statuses
  # GET /raspberry_pi_statuses.json
  def index
    @raspberry_pi_statuses = RaspberryPiStatus.first
    render json: {ok: @raspberry_pi_statuses.state}
  end

end
