class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:img])
  end

  before_action :set_search

  def set_search
    @q = Booking.ransack(params[:q])
    @bookings = @q.result
  end

end
