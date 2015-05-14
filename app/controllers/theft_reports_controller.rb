class TheftReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @theftReports = TheftReport.all
  end

  def new
    @theftReport = TheftReport.new
    @current_user = current_user
    @bikes = @current_user.bikes
  end

  def create
    @theftReport = TheftReport.new(theft_report_params)
    @current_user = current_user
    @bikes = @current_user.bikes
    #@theftReport.bike_id = @bike.id 
    respond_to do |format|
      if @theftReport.save
        # if validation passes, redirect to theft admin
        format.html { redirect_to :user_theft_reports, :notice => 'Su reporte ha sido creado.' }
      else
        # if validation fails, throw error messages
        format.html { render :action => "new" }
        flash[:error] = @theftReport.errors.to_a if @theftReport.invalid?
      end

    end
  end

  def show
    
  end

  def edit
    @theftReport = TheftReport.find(params[:id])
    @statuses = TheftReport.statuses
  end

  def update
    @theftReport = TheftReport.find(params[:id])
    @statuses = TheftReport.statuses
    if @theftReport.update(theft_report_params)
      respond_to do |format|
      format.html { redirect_to :user_theft_reports, notice: 'El estado del reporte fue actualizado exitosamente.' }
    end
    else
      render('edit')
    end
    
  end

  def destroy
    item = params[:id]
    @theftReport = TheftReport.find(item)
    @theftReport.destroy
    respond_to do |format|
      format.html { redirect_to :user_theft_reports, notice: 'El reporte ha sido eliminado.' }
    end
  end

  def user_theft_reports
    @theftReports = TheftReport.joins(:bike).where('bikes.user_id = ?', current_user.id)
  end


  private
  def theft_report_params
    params.require(:theft_report).permit(:bike_id, :bike_name, :theft_details, :theft_location, :theft_date, :status)
  end
end
