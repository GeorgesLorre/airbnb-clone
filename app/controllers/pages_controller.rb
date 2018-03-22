class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard_contractor
    @services = Service.all
    @bookings_count = Booking.count_for(current_user.contractor)
  end

  def dashboard_client
  end
end
