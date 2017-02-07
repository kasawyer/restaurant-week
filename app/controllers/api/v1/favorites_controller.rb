class Api::V1::FavoritesController < ApplicationController
  respond_to :json

  def index
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @favorites = Favorite.all
    # render json: { @favorites, @restaurant }
  end

  def create
    favorite_data = JSON.parse(request.body.read)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(favorite_data["favorite"]["user_id"])
    @existing_favorite = Favorite.find_by(user: @user, restaurant: @restaurant)
    if !@existing_favorite.nil?
      @existing_favorite.update(marked: favorite_data["favorite"]["marked"])
      # render json: @existing_favorite
      render json: {
        favorite: @existing_favorite,
        message: "#{@restaurant.name} added to favorites"
      }
    else
      @favorite = Favorite.new(
        restaurant: @restaurant,
        user: @user,
        marked: favorite_data["favorite"]["marked"]
      )
      if @favorite.save
        # render json: @favorite
        render json: {
          favorite: @favorite,
          message: "Favorites updated success"
        }
      else
        render json: { message: "Did not work" }, status: 404
      end
    end
  end
end



    # @favorite = Favorite.find(params[:id])
    # if @favorite.update(marked: favorite_data["favorite"]["marked"])
    #   render json: {
    #     favorite: @favorite,
    #     message: "#{@restaurant.name} added to favorites"
    #   }
    # else
    #   render json: {
    #     favorite: @favorite
    #   }
    # end
