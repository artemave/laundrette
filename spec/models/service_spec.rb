require 'spec_helper'

describe Service do
  context "there is no order items linked to this service" do
    it "can be destroyed" do
      s = Service.create!
      expect(s.destroy).to be_destroyed
    end
  end

  context "there are items linked to this service" do
    it "can be destroyed" do
      s = Service.create!
      FactoryGirl.create(:order).items.create!(service: s)
      expect(s.destroy).to eq false
    end
  end
end
