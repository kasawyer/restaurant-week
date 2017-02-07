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
      render json: {
        favorite: @favorite,
        message: "#{@restaurant.name} added to favorites"
      }
  end
end

# else
#   @favorite = Favorite.new(
#     restaurant: @restaurant,
#     user: @user,
#     marked: favorite_data["favorite"]["marked"]
#   )
#   if @favorite.save
#     # render json: @favorite
#     render json: {
#       favorite: @favorite,
#       message: "Favorites updated success"
#     }
#   else
#     render json: { message: "Did not work" }, status: 404
#   end
# end


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
