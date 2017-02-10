require 'spec_helper'

describe Dined do
  let!(:dined) { FactoryGirl.create(:dined) }

  describe ".new" do
    it "has a value for marked" do
      expect(dined.marked).to eq(true)
    end
    it "has a restaurant" do
      expect(dined.restaurant.name).to eq("Blue Dragon")
    end
    it "has a user" do
      expect(dined.user.name).to eq("Person")
    end
  end
end
