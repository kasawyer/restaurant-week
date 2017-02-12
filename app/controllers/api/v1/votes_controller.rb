class Api::V1::VotesController < ApplicationController
  respond_to :json

  def index
    @review = Review.find(params[:review_id])
    @user = current_user
    @existing_vote = Vote.find_or_create_by(user: @user, review: @review)
    render json: @existing_vote
  end

  def update
    vote_data = JSON.parse(request.body.read)
    @review = Review.find(params[:review_id])
    @user = User.find(vote_data["vote"]["current_user_id"])
    @existing_vote = Vote.find_by(user: @user, review: @review)
    @existing_vote.update(value: vote_data["vote"]["value"])
    @total_votes = @review.total_votes
    render json: {
      total_votes: @total_votes,
      value: @existing_vote.value
    }
  end
end
