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
    if @edit_review.nil?
      @new_review = Review.new
    end
    if !@restaurant.reviews.empty?
      @reviews = @restaurant.reviews.order("updated_at DESC").all
      @review_sum = 0
      @restaurant.reviews.each do |review|
        @review_sum += review.rating
      end
      @average_rating = @review_sum / @restaurant.reviews.length.to_f
      if !@edit_review.nil?
        @edit_review = @restaurant.reviews.find(params[:review_id])
      end
    end

    client = Yelp::Client.new(
      consumer_key: ENV["YELP_CONSUMER_KEY"],
      consumer_secret: ENV["YELP_CONSUMER_SECRET"],
      token: ENV["YELP_TOKEN"],
      token_secret: ENV["YELP_TOKEN_SECRET"]
    )

    params = {
      term: @restaurant.name,
      category_filter: 'restaurants',
      limit: 1
    }

    response = client.search('MA', params)
    @restaurant_array = @restaurant.name.split
    @name_check = @restaurant_array[0]
    @yelp_name = response.businesses[0].name
    if @yelp_name.include?(@name_check)
      @yelp_info = response
    end

    if @yelp_info
      @phone = @yelp_info.businesses[0].display_phone
      @rating_img = @yelp_info.businesses[0].rating_img_url_large
      @review_count = @yelp_info.businesses[0].review_count
      @yelp_url = @yelp_info.businesses[0].url
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
