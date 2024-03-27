class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end
    
    private
    def order_params
        params.require(:order).permit(:customer_id, :address_name, :post_code, :shipping_address, :postage, :payment_method, :total_money, :name)
    end
    
end
