# frozen_string_literal: true

require 'modules/persistable'

class Checkout
  include Persistable

  def scan(item)
    create(item)
  end

  def total
    all.sum(&:price)
  end
end