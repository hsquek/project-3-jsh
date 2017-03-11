class BookingsController < ApplicationController
  respond_to :html, :js

  def index
    @booking = Booking.new
    @bookings = Booking.all
    @facility_types = FacilityType.all
    @facilities = Facility.all
  end

  def new
    @booking = Booking.new
    @facilities = Facility.all
    @facility_types = FacilityType.all
  end

  def create
    @booking = Booking.new(params[:booking])
    @booking.save
    redirect_to @booking
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
