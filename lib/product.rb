# frozen_string_literal: true
class Product
  attr_reader :id, :name, :price

  def initialize(attributes = {})
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @price = attributes.fetch(:price)
  end
end