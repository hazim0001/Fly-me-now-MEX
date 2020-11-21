class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @airplane = Airplane.find(params[:airplane_id])
    authorize @booking
    validate_booking_and_catch_errors
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Your booking has been updated"
    else
      render :new
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, notice: "Your booking has been deleted"
  end

  private

  def validate_booking_and_catch_errors
    if @airplane.bookings.count >= 1
      if @booking.start_time.between?(
        @airplane.bookings.map {|b| b.start_time }.to_s, @airplane.bookings.map {|b| b.end_time }.to_s
      ) == true
        redirect_to airplanes_path, notice: "Sorry we cannot proceed with your request this airplane is booked during the selected dates"
      else
        @booking.airplane = @airplane
        @booking.renter = current_user
        @booking.airplane.booked = true
        catch_error
      end
    else
      @booking.airplane = @airplane
      @booking.renter = current_user
      @booking.airplane.booked = true
      catch_error
    end
  end

  def catch_error
    if @booking.save
      redirect_to bookings_path, notice: "Your booking has been created"
    else
      render 'airplanes/show'
    end
  rescue NoMethodError
    redirect_to airplanes_path, notice: "Sorry we cannot proceed with your request please check the date entered"
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :renter, :airplane)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
