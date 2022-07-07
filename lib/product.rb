# frozen_string_literal: true

require 'modules/persistable'

class Product
  extend Persistable

  attr_reader :id, :name, :price

  def initialize(attributes = {})
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @price = attributes.fetch(:price)
  end
end