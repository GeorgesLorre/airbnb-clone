class ServicesController < ApplicationController

  def show
    find_service
  end

  def edit
    find_service
  end

  def update
    find_service
    @service.update(check_service)
    redirect_to service_path(@service)
  end

  def destroy
    find_service
    @service.destroy
    redirect_to services_path
  end

  private
  def find_service
    @service = Service.find(params[:id])
  end
  def check_service
    params.require(:service).permit(:name, :description, :price, :location, :category)
  end
end

