# frozen_string_literal: true
require "checkout"
require "promotion"
require "promotional_roles/min_quantity"
require "promotional_roles/min_spent"

describe Checkout do
  let(:checkout) { Checkout.new }
  let(:product) { build :product }

  describe "#scan" do
    it "adds the product to the list" do
      expect { checkout.scan(product) }.to change { checkout.all.count }.by(1)
    end

    it "doesn't add the product to the other checkout" do
      other_checkout = Checkout.new
      expect { checkout.scan(product) }.not_to change {
        other_checkout.all.count
      }
    end
  end

  describe "#total" do
    context "without promotional roles" do
      it "calculates the total amount" do
        other_product = build(:product, price: 45.0)
        checkout.scan(product)
        checkout.scan(other_product)
        expect(checkout.total).to eq(product.price + other_product.price)
      end
    end

    context "with promotional roles" do
      let(:p1) { build(:product, code: "001", price: 9.25) }
      let(:p2) { build(:product, code: "002", price: 45.0) }
      let(:p3) { build(:product, code: "003", price: 19.95) }

      it "calculates the total amount" do
        promotional_roles = Promotion.new

        promotional_roles.register(MinQuantity)
        promotional_roles.register(MinSpent)

        co = Checkout.new(promotional_roles)

        co.scan(p1)
        co.scan(p2)
        co.scan(p3)
        co.scan(p1)

        final_price = 0.9 * (2 * 8.5 + p2.price + p3.price)
        expect(co.total).to eq(final_price)
      end
    end
  end
end
