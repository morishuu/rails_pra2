class BookingsController < ApplicationController

  def index
    @bookings= Booking.all
  end

  def new
    @booking= Booking.new
  end

  def create
    @booking = Booking.new(params.require(:booking).permit(:room_name, :room_price, :room_com, :room_loc, :room_pic))
    if @booking.save
      flash[:notice] = "ルームを投稿をしました"
      redirect_to home_index_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
