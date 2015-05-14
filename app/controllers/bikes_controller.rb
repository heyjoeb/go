class BikesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create

    @bike = Bike.new(bike_params)
    @bike.user_id = current_user.id 
    respond_to do |format|
      if @bike.save
        # if validation passes, redirect to bike admin
        format.html { redirect_to :user_bikes, :notice => 'Su bicicleta ha sido guardada.' }
      else
        # if validation fails, throw error messages
        format.html { render :action => "new" }
        flash[:error] = @bike.errors.to_a if @bike.invalid?
      end

    end
  end

  def show
    
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      respond_to do |format|
      format.html { redirect_to :user_bikes, notice: 'Bicicleta actualizada exitosamente.' }
    end
    else
      render('edit')
    end
    
  end

  def destroy
    item = params[:id]
    @bike = Bike.find(item)
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to :user_bikes, notice: 'La bicicleta ha sido eliminada.' }
    end
  end

  def user_bikes
    @current_user = current_user
    @bikes = @current_user.bikes
  end

  


  private
  def bike_params
    params.require(:bike).permit(:user_id, :bike_name, :bike_brand, :bike_model, :bike_color, :bike_serial, :bike_details)
  end
end
