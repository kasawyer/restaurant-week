class Api::V1::RestaurantsController < ApplicationController
  respond_to :json

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @favorited_ids = @restaurant.favorites
    @favorited_ids.each do |favorited|
      if favorited.id == current_user.id
        @favorite = Favorite.find(params[:favorite_id])
      end
    end

    render json: @restaurant
  end
end
