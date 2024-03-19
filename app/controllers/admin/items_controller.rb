class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
          flash[:notice] = "保存しました！"
        redirect_to admin_item_path(@item.id)
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
        redirect_to admin_item_path(@item.id)
        else
            render :new
        end
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
