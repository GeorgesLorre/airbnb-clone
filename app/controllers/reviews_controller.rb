class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:id])
    @review = Review.new(review_params)
    @service = @booking.service
    @review.booking = @booking
    if @review.save
      respond_to do |format|
        format.html { redirect_to service_booking_path(@booking)}
        format.js
      end
    else
      respond_to do |format|
      format.html {'bookings/show'}
      format.js
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
