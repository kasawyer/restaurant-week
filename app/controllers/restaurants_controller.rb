class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order("LOWER(name) ASC")
    @restaurants =
      Kaminari.paginate_array(@restaurants).page(params[:page]).per(10)
    @cuisine_collection = Restaurant::CUISINES
    @region_collection = Restaurant::REGIONS
    @lunch_price_collection = Restaurant::LUNCH_PRICES
    @dinner_price_collection = Restaurant::DINNER_PRICES
    unless empty_search_params
      search_params = get_search_params
      @restaurants = Restaurant.search(search_params)
      @restaurants = @restaurants.page(params[:page]).per(10)
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @favorite = Favorite.find_or_create_by(user_id: current_user.id, restaurant_id: @restaurant.id)
    @dined = Dined.find_or_create_by(user_id: current_user.id, restaurant_id: @restaurant.id)
    if @edit_review.nil?
      @new_review = Review.new
    end
    if !@restaurant.reviews.empty?
      @reviews = @restaurant.reviews.order("updated_at DESC").all
      @review_sum = 0
      @restaurant.reviews.each do |review|
        @review_sum += review.rating
      end
      @average_rating = @review_sum/(@restaurant.reviews.length).to_f
      if !@edit_review.nil?
        @edit_review = @restaurant.reviews.find(params[:review_id])
      end
    end
  end

  private

  def empty_search_params
    params[:region].blank? && params[:cuisine].blank? &&
      params[:lunch_price].blank? && params[:dinner_price].blank? &&
      params[:keyword].blank?
  end

  def get_search_params
    { region: params[:region], cuisine: params[:cuisine],
      lunch_price: params[:lunch_price], dinner_price: params[:dinner_price],
      keyword: params[:keyword] }
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :image_url, :region, :address,
      :cuisine, :lunch_price, :lunch_menu_link, :dinner_price,
      :dinner_menu_link, :special_notes)
  end
end
