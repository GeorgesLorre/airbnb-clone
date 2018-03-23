class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review  = Review.new(review_params)
    @service = @booking.service
    @review.booking = @booking
    if @review.save
      respond_to do |format|
        flash[:notice]="Review saved"
        format.html { redirect_to service_path(@service)}
      end
    else
      respond_to do |format|
        flash[:error]="Something went wrong"
        format.html { redirect_to service_path(@service)}
    end
  end
end

  private

  def review_params
    params.require(:review).permit(:booking_id, :service_id, :rating, :description)
  end
end
