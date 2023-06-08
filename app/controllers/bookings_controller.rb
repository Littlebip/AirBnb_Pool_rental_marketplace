class BookingsController < ApplicationController
  def index
    set_pool
    @bookings = Booking.where(pool_id: @pool)
  end

  def create
    set_pool
    @booking = Booking.new(booking_params)
    @booking.pool = @pool
    @booking.user = current_user
    @booking.status = 'pending'
    # @duration = @booking.end_date - @booking.start_date
    if @booking.save
      redirect_to pool_bookings_path(@pool)
    else
      redirect_to pool_path(@pool), status: :unprocessable_entity
    end
  end

  private

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end

  def set_booking
    set_pool
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :details)
  end
end
