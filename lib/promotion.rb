# frozen_string_literal: true

class Promotion
  attr_reader :roles
  attr_accessor :total

  def initialize
    @roles = []
  end

  def register(mod)
    roles << mod
  end

  def apply(checkout)
    self.total = checkout.price
    roles.each { |role| self.total = role.call(checkout) }
    self
  end
end
