class Public::CartitemsController < ApplicationController
    def index
        @customer = current_customer
        @cart_items = @customer.cartitems
        @total = 0
    end
    
  def create
    @cart_item = Cartitem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items=current_customer.cartitems.all
    @cart_items.each do |cart_item|
      if cart_item.item_id==@cart_item.item_id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
        redirect_to cartitems_path, notice: "カートにアイテムを追加しました"
      end
    end
      
    if @cart_item.save
      redirect_to cartitems_path, notice: "カートにアイテムを追加しました"
    end
  end
    
    def update
        @cart_item = Cartitem.find(params[:id])
        @cart_item.update(cart_item_params)
        flash[:notice] = "変更されました！"
        redirect_to cartitems_path
    end
    
    def destroy
        @cart_item = Cartitem.find(params[:id])
        @cart_item.destroy
        redirect_to '/cartitems'
    end
    
     def destroy_all
       current_customer.cartitems.destroy_all
       redirect_to cartitems_path, notice: 'カートが空になりました。' 
     end
    
    private
    def cart_item_params
        params.require(:cartitem).permit(:item_id, :quantity)
    end

end
