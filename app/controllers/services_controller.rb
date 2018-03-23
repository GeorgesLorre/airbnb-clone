class ServicesController < ApplicationController

  before_action :set_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, except: [:create, :update, :destroy]

  def index

   respond_to do |format|
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @services = Service.where(sql_query, query: "%#{params[:query]}%")

      format.js
    else
      @services = Service.all
      format.html
    end
   end
  end

  def contractor_services
    @contractor_services = current_user.contractor.services
  end

  def show
     @booking = Booking.new
     @markers =[{ 'lat': @service.latitude, 'lng': @service.longitude }]
  end

  def edit

  end

  def update
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy

    @service.destroy
    redirect_to services_path
  end

  def new
    @service = Service.new
    @user = current_user
  end

  def create

    @service = Service.new(service_params)
    @contractor = current_user.contractor
    @service.contractor = @contractor
    if @service.save!
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :location, :category, :photo )
  end
end
