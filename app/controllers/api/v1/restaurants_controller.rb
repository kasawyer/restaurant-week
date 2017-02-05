class Api::V1::RestaurantsController < ApplicationController
  respond_to :json

  def show
    @restaurants = Restaurant.all
    render json: @restaurants
  end
end
