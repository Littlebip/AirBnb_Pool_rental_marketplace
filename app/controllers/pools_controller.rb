class PoolsController < ApplicationController
  def show
    set_pool
    @booking = Booking.new
  end

  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.create(pool_params)
    redirect_to pool_path(@pool)
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])

  def pool_params
    params.require(:pool).permit(:address, :size, :price, :details, :images)
  end

end
