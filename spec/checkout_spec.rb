# frozen_string_literal: true
require 'checkout'

describe Checkout do

  describe "#scan" do
    let(:product) { build :product }
    
    it "adds the product to the list" do
      checkout = Checkout.new
      expect { checkout.scan(product) }.to change { checkout.all.count }.by(1)
    end

    it "doesn't add the product to the other checkout" do
      checkout1 = Checkout.new
      checkout2 = Checkout.new
      expect { checkout1.scan(product) }.not_to change { checkout2.all.count }
    end
  end

  describe "#total" do
    it "calculates the total amount" do
      checkout = Checkout.new
      p1 = build(:product, price: 9.25)
      p2 = build(:product, price: 45.0)
      checkout.scan(p1)
      checkout.scan(p2)
      expect(checkout.total).to eq(p1.price + p2.price)
    end
  end
end