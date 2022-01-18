class BookingsController < ApplicationController

  def index
    @q = Booking.ransack(params[:q])
    @bookings = @q.result
  end

  def new
    @booking= Booking.new
  end

  def create
    @booking = Booking.new(params.require(:booking).permit(:room_name, :room_price, :room_com, :room_loc, :room_pic, :user_id))
    if @booking.save
      flash[:notice] = "ルームを投稿をしました"
      redirect_to home_index_path
    else
      render "new"
    end
  end

  def show
    @bookings = current_user.bookings
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
        @booking.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to bookings_path
  end
end
