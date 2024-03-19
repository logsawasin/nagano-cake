class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
         flash[:notice] = "保存完了！"
         redirect_to admin_customer_path(@customer.id)
        else
          render :edit
        end
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number)
    end
end
