class Admin::HomesController < ApplicationController
    def top
        @orders = Customer.all
        @orders = Order.all
        @order_item = 0
    end
end
