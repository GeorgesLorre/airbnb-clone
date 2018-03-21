class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard_contractor
    @services = Service.all
  end

  def dashboard_client
  end
end
