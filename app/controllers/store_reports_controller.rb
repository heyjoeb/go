class StoreReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @storeReports = StoreReport.all
  end

  def new
    @storeReport = StoreReport.new
  end

  def create

    @storeReport = StoreReport.new(store_report_params)
    @storeReport.user_id = current_user.id 
    respond_to do |format|
      if @storeReport.save
        # if validation passes, redirect to bike admin
        format.html { redirect_to :user_store_reports, :notice => 'Su reporte de tienda ha sido creado.' }
      else
        # if validation fails, throw error messages
        format.html { render :action => "new" }
        flash[:error] = @storeReport.errors.to_a if @storeReport.invalid?
      end

    end
  end

  def show
    
  end

  def edit
    @storeReport = StoreReport.find(params[:id])
    @statuses = StoreReport.statuses
  end

  def update
    @storeReport = StoreReport.find(params[:id])
    @statuses = StoreReport.statuses
    if @storeReport.update(store_report_params)
      respond_to do |format|
      format.html { redirect_to :user_store_reports, notice: 'El estado del reporte fue actualizado exitosamente.' }
    end
    else
      render('edit')
    end
    
  end

  def destroy
    item = params[:id]
    @storeReport = StoreReport.find(item)
    @storeReport.destroy
    respond_to do |format|
      format.html { redirect_to :user_store_reports, notice: 'El reporte ha sido eliminado.' }
    end
  end

  def user_store_reports
    @current_user = current_user
    @storeReports = @current_user.store_reports
  end

  


  private
  def store_report_params
    params.require(:store_report).permit(:user_id, :store_name, :store_location, :store_details, :store_report_date, :status )
  end
end
