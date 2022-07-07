# frozen_string_literal: true

require 'promotional_roles/min_spent'

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
    roles.each do |role|
      self.total = role.call(checkout)
    end
    self
  end
end