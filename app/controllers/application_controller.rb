class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

    def show_all_stops(r_id, d_id)
      base = LineItem.find_by_route_id(r_id)
      bound = base.find_by_direction_id(d_id)
  	end

end
