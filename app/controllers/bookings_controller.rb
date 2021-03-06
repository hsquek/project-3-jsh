class BookingsController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!, show: [:mybookings, :index, :new]

  def index
    # @booking = Booking.new
    @bookings = Booking.where(user_id: current_user.id)
    @facility_types = FacilityType.all
    @facilities = Facility.all
  end

  def new
    @booking = Booking.new
    @bookings = Booking.all
    # @all_facilities = Facility.all
    # @facility_types = FacilityType.all
    @fac_type = FacilityType.find(params[:facility_type_id])
    @fac_open = @fac_type.opens_at.to_i
    @fac_close = @fac_type.closes_at.to_i
    @facilities = Facility.where(facility_type_id: params[:facility_type_id]).to_a
  end

  def create
    @bookings = Booking.where(user_id: current_user.id)
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Success"
    else
      flash[:alert] = "Booking failed"
    end
    # @booking.save
  end

  # def edit
  # end
  #
  # def update
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @bookings = Booking.where(user_id: current_user.id)
    @booking.destroy
    respond_to do |format|
        format.js { render 'bookings/mybookings'}
    end
  end

  def mybookings
    @user = User.find(current_user.id)
    @bookings = Booking.where(user_id: @user)
  end

  # def show
  #   @booking = Booking.find(params[:id])
  # end

  def calendar
    @booking = Booking.new
    @bookings = Booking.all
    @fac_type = FacilityType.find(params[:facility_type_id])
    @fac_open = @fac_type.opens_at.to_i
    @fac_close = @fac_type.closes_at.to_i
    @facilities = Facility.where(facility_type_id: params[:facility_type_id]).to_a
  end

  private

  def booking_params
    params.require(:booking).permit(:facility_id, :user_id, :facility_type_id, :booking_date, :start_at)
  end
end
