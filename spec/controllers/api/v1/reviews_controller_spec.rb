require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:user) do
    FactoryGirl.create(:user,
    email: "persona@person.com")
  end

  let!(:person1) do
    FactoryGirl.create(:user,
    email: "person1@person.com",
    name: "Person 1")
  end

  let!(:blue_dragon) do
    FactoryGirl.create(:restaurant)
  end

  let!(:review1) do
    FactoryGirl.create(:review,
    user: user,
    restaurant: blue_dragon)
  end

  let!(:review2) do
    FactoryGirl.create(:review,
    rating: 4,
    body: "Pretty good option for Dine Out.",
    user: person1,
    restaurant: blue_dragon)
  end

  describe "GET#index" do
    it "should return all the reviews for a given restaurant" do
      get :index, params: { restaurant_id: blue_dragon.id }
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
      expect(json[1]["rating"]).to eq(5)
      expect(json[1]["body"]).to eq("Great restaurant for Dine Out Boston!")
      expect(json[0]["rating"]).to eq(4)
      expect(json[0]["body"]).to eq("Pretty good option for Dine Out.")
    end
  end

  describe "DELETE #destroy" do
    it "should delete the review" do
      delete :destroy, params: { restaurant_id: blue_dragon.id, id: review1.id }
      reviews = Review.all.map { |review| review.id }

      expect(reviews.length).to eq(1)
      expect(reviews.find { |id| id == review1.id }).to be(nil)
    end
  end
end
