class FacilityTypesController < ApplicationController
  def index
    @facility_types = FacilityType.all
    @facilities = Facility.all
    @booking = Booking.new
  end

  def show
    @facility_type = FacilityType.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
