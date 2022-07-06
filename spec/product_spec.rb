# frozen_string_literal: true
require 'product'

describe Product do

  describe("#name") do
    let(:product) { build :product }

    it("returns the name of a product") do
      expect(product.name).to eq('Lavender heart')
    end
  end
end