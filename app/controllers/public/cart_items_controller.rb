class Public::CartItemsController < ApplicationController
    def index
        @customer = current_customer
        @cart_item = Cart_item.find(params[:id])
        @total = 0
    end
    
    def create
        @cart_item = Cart_item.new(cart_item_params)
        @cart_item.save
        redirect_to cart_items_path(cart_item.id)
    end
    
    def update
        @cart_item = Cart_item.find(params[:id])
        @cart_item.update(cart_item_params)
        flash[:notice] = "変更されました！"
        redirect_to cart_items_path(cart_item.id)
    end
    
    def destroy
    end
    
    private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end

end
