class Order < ApplicationRecord
    has_many :order_items
    belongs_to :customer
    enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
    def address_display
     '〒' + post_code + ' ' + shipping_address + ' ' + address_name
    end
end
