class Cartitem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    def subtotal
    item.with_tax_price * quantity
    end
end