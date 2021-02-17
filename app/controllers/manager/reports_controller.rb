# frozen_string_literal: true

module Manager
  class ReportsController < Manager::BaseController
    before_action :authenticate_manager_restaurant_user!
    before_action :set_restaurant

    def index
      @receipts = @restaurant.receipts.includes(:order).order(created_at: :DESC)
      .where("created_at >= ?", Date.parse(params[:after_created_at]) || 10.years.ago)
      .where("created_at <= ?", (Date.parse(params[:before_created_at]) || Date.today)+1.days)
      .limit(500)
    end

    private

  end
end
