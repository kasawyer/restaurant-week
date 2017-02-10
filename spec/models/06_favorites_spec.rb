require 'spec_helper'

describe Favorite do
  let!(:favorite) { FactoryGirl.create(:favorite) }

  describe ".new" do
    it "has a value for marked" do
      expect(favorite.marked).to eq(true)
    end
    it "has a restaurant" do
      expect(favorite.restaurant.name).to eq("Blue Dragon")
    end
    it "has a user" do
      expect(favorite.user.name).to eq("Person")
    end
  end
end
