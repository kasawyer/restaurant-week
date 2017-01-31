class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :image_url, :region, :address, :cuisine, :lunch_price, :lunch_menu_link, :dinner_price, :dinner_menu_link, :special_notes)
  end
end
