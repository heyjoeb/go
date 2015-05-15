class ReportsController < ApplicationController
  def index
    @theftReports = TheftReport.all
    @storeReports = StoreReport.all
    unless params[:q].blank?
      @theftReports = @theftReports.where(bike_name: q)
    end
  end
end
