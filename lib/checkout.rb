# frozen_string_literal: true

require "modules/persistable"

class Checkout
  include Persistable

  attr_reader :promotion

  def initialize(promotion = nil)
    @promotion = promotion
  end

  def scan(item)
    create(item)
  end

  def price
    all.sum(&:price)
  end

  def total
    promotion ? promotion.apply(self).total : price
  end
end
