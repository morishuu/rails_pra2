class ResarvationsController < ApplicationController
  def index
    @resarvations = current_user.resarvations
    
  end

  def new
    
    @booking = Booking.find_by(id: params[:format])
    @resarvation = Resarvation.new
    session.delete(:resarvation)

  end
  
  def confirm
    @booking = Booking.find_by(id: params[:format])
    @resarvation = Resarvation.new(params.require(:resarvation).permit(:start_day, :end_day, :menbers, :booking_id, :user_id))
    @nights = (@resarvation.end_day.to_date- @resarvation.start_day.to_date).to_i
    @sum = @nights * @resarvation.menbers*@booking.room_price
    session[:resarvation] = @resarvation
    if @resarvation.invalid?
       render :new
    end
  end

  def back
    @booking = Booking.find_by(id: params[:format])
    @resarvation = Resarvation.new(session[:resarvation])
    session.delete(:resarvation)
    render :new

  end

  def complete
    @booking = Booking.find_by(id: params[:format])
    @resarvation = Resarvation.create!(session[:resarvation])
    @nights = (@resarvation.end_day.to_date- @resarvation.start_day.to_date).to_i
    @sum = @nights * @resarvation.menbers*@booking.room_price
    session.delete(:resarvation)
    
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
