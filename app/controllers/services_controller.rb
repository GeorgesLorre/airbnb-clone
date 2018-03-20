class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
    @user = current_user
  end

  def create
    @service = Service.new(service_params)
    @user = current_user
    @service.user = @user
    if @service.save
      redirect_to services_index_path
    else
      render :new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :location)
  end
end
