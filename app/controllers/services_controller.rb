class ServicesController < ApplicationController

  before_action :set_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, except: [:create, :update, :destroy]

  def index
    @services = Service.all
  end

  def show

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
    @service.pictures.build
    @user = current_user
  end

  def create
    @service = Service.new(service_params)
    @contractor = current_user.contractor
    @service.contractor = @contractor
    if @service.save
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
    params.require(:service).permit(:name, :description, :price, :location, :category, :pictures, pictures_attributes: [:url, :url_cache])
  end
end
