class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard_contractor
    @services = Service.all
    @bookings_count = Booking.link_contractor(current_user.contractor).count
    @cashed_in = Booking.link_contractor(current_user.contractor).sum(:price)
    @bookings_list = Booking.link_contractor(current_user.contractor)
  end

  def dashboard_client
  end
end
