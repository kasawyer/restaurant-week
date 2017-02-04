require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { FactoryGirl.create(:admin) }

  describe ".new" do
    it "has a name" do
      expect(admin.name).to eq("Admin")
    end

    it "has a password" do
      expect(admin.password).to eq("password1234")
    end

    it "has a password confirmation" do
      expect(admin.password_confirmation).to eq("password1234")
    end

    it "has an email" do
      expect(admin.email).to eq("admin@admin.com")
    end
  end
end
