class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  ## not sure why this is here?
  # def show
  #   @booking = Booking.new
  # end
  ##

  def show
    set_pool
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
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
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:address, :size, :price)
  end
end
