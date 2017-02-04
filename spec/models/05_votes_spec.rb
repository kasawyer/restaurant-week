require 'spec_helper'

describe Vote do
  let!(:user) { FactoryGirl.create(:user, email: "person1@person.com")}
  let!(:vote) { FactoryGirl.create(:vote, user: user) }

  describe ".new" do
    it "has a value" do
      expect(vote.value).to eq(0)
    end

    it "has a review" do
      expect(vote.review.rating).to eq(5)
    end

    it "has a user" do
      expect(vote.user.name).to eq("Person")
    end
  end
end
