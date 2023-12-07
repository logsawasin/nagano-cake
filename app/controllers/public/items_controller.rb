class Public::ItemsController < ApplicationController
  
    def index
      @items = Item.all
    end
    
    def show
      @cart_item = Cartitem.new
      @item = Item.find(params[:id])
    end
end
