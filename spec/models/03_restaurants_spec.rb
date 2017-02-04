require 'spec_helper'

describe Restaurant do
  let!(:restaurant) { FactoryGirl.create(:restaurant) }

  describe ".new" do
    it "has a name" do
      expect(restaurant.name).to eq("Blue Dragon")
    end

    it "has an image url" do
      expect(restaurant.image_url).to eq("https://res-1.cloudinary.com/simpleview/image/fetch/c_fill,f_auto,h_202,q_60,w_267/https://boston.simpleviewcrm.com/images/listings/original_BlueDragonLunchSalmon0.jpg")
    end

    it "has a region" do
      expect(restaurant.region).to eq("Boston - Fort Point")
    end

    it "has an address" do
      expect(restaurant.address).to eq("324 A Street Boston, MA 02210")
    end

    it "has a cuisine" do
      expect(restaurant.cuisine).to eq("Asian")
    end

    it "has a lunch price" do
      expect(restaurant.lunch_price).to eq("$20")
    end

    it "has a lunch menu link" do
      expect(restaurant.lunch_menu_link).to eq("https://boston.simpleviewcrm.com/docs/amenities/BD%20Dine%20Out%20Lunch%2020171.pdf")
    end

    it "has a dinner price" do
      expect(restaurant.dinner_price).to eq("$38")
    end

    it "has a dinner menu link" do
      expect(restaurant.dinner_menu_link).to eq("https://boston.simpleviewcrm.com/docs/amenities/BD%20Dine%20Out%20Dinner%202017.pdf")
    end

    it "has special notes" do
      expect(restaurant.special_notes).to eq("Open daily")
    end
  end
end
