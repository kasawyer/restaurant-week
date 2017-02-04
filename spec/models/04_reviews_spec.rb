require 'spec_helper'

describe Review do
  let!(:review) { FactoryGirl.create(:review) }

  describe ".new" do
    it "has a rating" do
      expect(review.rating).to eq(5)
    end
    it "has a body" do
      expect(review.body).to eq("Great restaurant for Dine Out Boston!")
    end
    it "has a restaurant" do
      expect(review.restaurant.name).to eq("Blue Dragon")
    end
    it "has a user" do
      expect(review.user.name).to eq("Person")
    end
  end
end
