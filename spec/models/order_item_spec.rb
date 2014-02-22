require 'spec_helper'

describe OrderItem do
  let(:order) { FactoryGirl.create :order }

  context "on create" do
    it "recalculates order total" do
      order.items.create!(price: 1.30.to_money, quantity: 1)
      order.reload.read_attribute(:total_pennies).should == 130

      order.items.create!(price: 1.00.to_money, quantity: 2)
      order.reload.read_attribute(:total_pennies).should == 330
    end
  end

  context "on update" do
    before do
      order.items.create!(price: 1.30.to_money, quantity: 1)
    end

    it "recalculates order total" do
      order.items.first.update_attribute :quantity, 2

      order.reload.read_attribute(:total_pennies).should == 260
    end
  end

  context "on destroy" do
    before do
      2.times { order.items.create!(price: 1.30.to_money, quantity: 1) }
    end

    it "recalculates order total" do
      order.items.last.destroy

      order.reload.read_attribute(:total_pennies).should == 130
    end
  end
end
