class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @new_review = Review.new(review_params)
    @new_review.restaurant = @restaurant
    @new_review.user = current_user
    if user_signed_in?
      if @new_review.save
        flash[:notice] = "Review added successfully!"
        redirect_to restaurant_path(@restaurant)
      else
        flash.now[:notice] = @new_review.errors.full_messages.to_sentence
        render :'/restaurants/show'
      end
    else flash[:notice] = "User must be signed in!"
    end
  end

  def index
    @user = current_user
    @reviews = @user.reviews
    @restaurants = []
    @reviews.each do |review|
      @restaurant_id = review.restaurant_id
      @restaurant = Restaurant.find(@restaurant_id)
      @restaurants << @restaurant
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user_id, :restaurant_id,
      :timestamp)
  end
end
