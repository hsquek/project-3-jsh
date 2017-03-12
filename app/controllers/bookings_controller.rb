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
    @booking = Booking.new(booking_params)
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

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_idea
  #   @idea = Idea.find(params[:id])
  #   @tags = @idea.tags
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:facility_id, :user_id, :facility_type_id, :date, :start_time)
  end
end
