module MinQuantity
  def self.call(checkout)
    value = checkout.promotion.total
    discount_count = checkout.all.count {|p| p.code == '001'}
    unit_discount = 9.25 - 8.5
    if discount_count >= 2
      value -= discount_count * unit_discount
    end
    value
  end
end 