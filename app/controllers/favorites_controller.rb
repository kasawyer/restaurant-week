class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.favorites.where("marked = true")
    @restaurants = []
    @favorites.each do |favorite|
      @restaurant_id = favorite.restaurant_id
      @restaurant = Restaurant.find(@restaurant_id)
      @restaurants << @restaurant
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:marked, :user_id, :restaurant_id)
  end
end
