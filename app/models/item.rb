class Item < ApplicationRecord
    
    def price
       with_tax_price
    end
  
    def with_tax_price
        (without_tax_price * 1.1).floor
    end
    
    has_one_attached :image
    has_many :cartitems
end
