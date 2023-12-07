class OrderItem < ApplicationRecord
    attr_accessor :manufacture_status
    belongs_to :order
  def price
    original_price = self.item.price
    tax_included_price = original_price * (1 + self.item.tax_rate)
    
    return tax_included_price
  end
  
  def price=(value)
    self[:price] = value
  end
  
  def number=(value)
    self[:number] = value
  end
end
