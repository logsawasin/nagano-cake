class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_items_path(@item.id)
    end
    
    def new
        @item = Item.new
    end
    
    def show
      @cart_item = Cartitem.new
      @item = Item.find(params[:id])
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to '/admin/items'
    end
    
private
    def item_params
        params.require(:item).permit(:name, :text, :without_tax_price, :image)
    end
end
