class ReportsController < ApplicationController
  def index
    @theftReports = TheftReport.all
    @storeReports = StoreReport.all
  end
end
