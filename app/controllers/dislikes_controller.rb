class DislikesController < ApplicationController

  def create
		user = User.find(params[:user_id])
		@restaurant = Restaurant.find(params[:restaurant_id])
		user.restaurant_dislikes.push(@restaurant)
		redirect_to restaurants_path
	end

end
