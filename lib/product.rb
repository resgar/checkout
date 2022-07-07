# frozen_string_literal: true

require 'modules/persistable'

class Product
  extend Persistable

  attr_reader :code, :name, :price

  def initialize(attributes = {})
    @code = attributes.fetch(:code)
    @name = attributes.fetch(:name)
    @price = attributes.fetch(:price)
  end
end