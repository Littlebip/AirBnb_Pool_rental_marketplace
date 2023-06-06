class PoolsController < ApplicationController
  def index
    @pools = pool.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @pool = pool.new
  end

  def create
    @pool = pool.new(pool_params)
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pool.destroy
    redirect_to pools_path, status: :see_other
  end

  private

  def set_pool
    @pool = pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:address, :size, :price)
  end
end
