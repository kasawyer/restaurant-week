class Api::V1::DinedsController < ApplicationController
  respond_to :json

  def index
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dined = Dined.find_or_create_by(user: @user, restaurant: @restaurant)
    render json: { dined: @dined }
  end

  def update
    dined_data = JSON.parse(request.body.read)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.find(dined_data["dined"]["user_id"])
    @dined = Dined.find_by(user: @user, restaurant: @restaurant)
    @dined.update!(marked: dined_data["dined"]["marked"])
    render json: { dined: @dined }
  end
end
