require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".new" do
    it "has a name" do
      expect(user.name).to eq("Person")
    end

    it "has a password" do
      expect(user.password).to eq("password1234")
    end

    it "has a password confirmation" do
      expect(user.password_confirmation).to eq("password1234")
    end

    it "has an email" do
      expect(user.email).to eq("person@person.com")
    end
  end
end
