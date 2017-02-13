class DinedsController < ApplicationController
  def index
    @user = current_user
    @user_id = @user.id
    @dineds = @user.dineds.where("marked = true")
    @restaurants = []
    @dineds.each do |dined|
      @restaurant_id = dined.restaurant_id
      @restaurant = Restaurant.find(@restaurant_id)
      if @user.reviews.where("restaurant_id = @restaurant_id")
        @reviews = @user.reviews.where("restaurant_id = @restaurant_id")
      end
      @restaurants << @restaurant
    end
  end

  private

  def dined_params
    params.require(:dined).permit(:marked, :user_id, :restaurant_id)
  end
end
