class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
        if @customer.update(customer_params)
         flash[:notice] = "保存完了！"
         redirect_to customers_my_page_path
        else
          render :edit
        end
    end
    
    def confirmation
    end
    
    def withdrawal
        @customer = current_customer
        @customer.update(is_deleted: true)
        reset_session
        redirect_to new_customer_session_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number)
    end
end
