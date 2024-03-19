class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
    end
    
    def confirmation
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.address_name = current_customer.first_name + current_customer.last_name
      @cart_items = current_customer.cartitems
    end
    
    def create
       @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cartitems.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderItem.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.tax_included_price = cart_item.item.price
      @order_details.quantity = cart_item.quantity
      @order_details.manufacture_status = 0
      @order_details.save!
    end
    
    @cart_items.destroy_all
    redirect_to orders_completed_path
    end
    
    def index
      @orders = Order.all
    end
    
    def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items
    end
    
    private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address_name, :shipping_address, :postage, :total_money, :customer_id, :name )
  end
  
  # def order_params
  #   cart_items = current_customer.cartitems
  #   if cart_items.blank?
      
  #     redirect_to cart_items_path
      
  #   end
  # end
end
