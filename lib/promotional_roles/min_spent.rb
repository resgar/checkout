module MinSpent
  def self.call(checkout)
    value = checkout.promotion.total
    value > 60 ? 0.9 * value : value
  end
end 