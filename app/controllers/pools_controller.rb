class PoolsController < ApplicationController
  def show
    set_pool
    @booking = Booking.new
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end
end
