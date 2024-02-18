class OrderItem < ApplicationRecord
    attr_accessor :manufacture_status
    belongs_to :order
    belongs_to :item
  
  def subtotal
    price * quantity
  end
  
  def price=(value)
    self[:price] = value
  end
  
  def number=(value)
    self[:number] = value
  end
end
