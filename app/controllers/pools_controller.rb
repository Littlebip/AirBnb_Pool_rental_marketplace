class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @pool = Pool.new
  end

  def create
    @Pool = Pool.new(Pool_params)
    if @Pool.save
      redirect_to Pool_path(@Pool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @Pool.destroy
    redirect_to pools_path, status: :see_other
  end

  private

  def set_Pool
    @Pool = Pool.find(params[:id])
  end

  def Pool_params
    params.require(:Pool).permit(:address, :size, :price)
  end
end
