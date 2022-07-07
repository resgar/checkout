# frozen_string_literal: true
require "product"

describe Product do
  describe "#name" do
    let(:product) { build :product }

    it "returns the name of a product" do
      expect(product.name).to eq("Lavender heart")
    end
  end

  describe "#all" do
    it "returns the list of products" do
      expect(Product.all).to be_empty
    end
  end

  describe "#create" do
    it "create a new product" do
      expect {
        Product.create(code: "001", name: "Lavender heart", price: 9.25)
      }.to change { Product.all.count }.by(1)
    end
  end
end
