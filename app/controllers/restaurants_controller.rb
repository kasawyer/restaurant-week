class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order("name ASC")
    @cuisine_collection = Restaurant::CUISINES
    @region_collection = Restaurant::REGIONS
    @lunch_price_collection = Restaurant::LUNCH_PRICES
    @dinner_price_collection = Restaurant::DINNER_PRICES
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("name ASC")
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if @edit_review.nil?
      @new_review = Review.new
    end
    if !@restaurant.reviews.empty?
      @reviews = @restaurant.reviews.order("updated_at DESC").all
      if !@edit_review.nil?
        @edit_review = @restaurant.reviews.find(params[:review_id])
      end
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :image_url, :region, :address,
      :cuisine, :lunch_price, :lunch_menu_link, :dinner_price,
      :dinner_menu_link, :special_notes)
  end
end
