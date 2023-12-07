class Public::CartitemsController < ApplicationController
    def index
        @customer = current_customer
        @cart_items = current_customer.cartitems.all
        @total = 0
    end
    
    def create
        if Item.find_by(name:"モンブラン")
            
        @cart_item = Cartitem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        @cart_item.save
        redirect_to cartitems_path
        end
    end
    
    def update
        @cart_item = Cart_item.find(params[:id])
        @cart_item.update(cart_item_params)
        flash[:notice] = "変更されました！"
        redirect_to cart_items_path(cart_item.id)
    end
    
    def destroy
        @cart_item = Cartitem.find(params[:id])
        @cart_item.destroy
        redirect_to '/cartitems'
    end
    
    private
    def cart_item_params
        params.require(:cartitem).permit(:item_id, :quantity)
    end

end
