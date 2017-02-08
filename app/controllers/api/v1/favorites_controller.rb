class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def index
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = Favorite.find_or_create_by(user: @user, restaurant: @restaurant)
    render json: { favorite: @favorite }
  end

  def update
    favorite_data = JSON.parse(request.body.read)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(favorite_data["favorite"]["user_id"])
    @favorite = Favorite.find_by(user: @user, restaurant: @restaurant)
    @favorite.update!(marked: favorite_data["favorite"]["marked"])
    render json: { favorite: @favorite }
  end
end
