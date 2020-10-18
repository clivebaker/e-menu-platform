
module Manager
  class ReportingController < Manager::BaseController
    before_action :authenticate_manager_restaurant_user!
    before_action :set_restaurant

    def daily
      @daily_reportings = DailyReporting.where(restaurant: @restaurant.id).order(date: :desc)
    end

    def zreport_show
      @daily_reporting = DailyReporting.find_by(restaurant_id: @restaurant.id, id: params[:daily_reporting_id])
    end
  end
end