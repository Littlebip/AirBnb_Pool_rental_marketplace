class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_pool, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pool = @pool
    if @booking.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to pool_path(@booking.pool), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :details, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end
end
