class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    set_pool
    @booking = Booking.new
    @markers =[
      {
        lat: @pool.latitude,
        lng: @pool.longitude
      }]
    # @markers =
    #   {
    #     lat: @pool.latitude,
    #     lng: @pool.longitude
    #   }
  end

  def index
    @pools = Pool.all
    @markers = @pools.geocoded.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }
    end
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:address, :size, :price, :details, :title, images: [])
  end
end
