class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def update
    favorite_data = JSON.parse(request.body.read)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(favorite_data["favorite"]["current_user_id"])
  end
end
