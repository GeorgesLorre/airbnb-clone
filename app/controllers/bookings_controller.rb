class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @booking.service = Service.find(params[:service_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.client = current_user.client
    @booking.service = Service.find(params[:service_id])
    @booking.save
    redirect_to service_booking_path(@booking.service, @booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
