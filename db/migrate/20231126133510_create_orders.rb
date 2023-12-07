class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    t.integer "customer_id"
    t.string "address_name"
    t.string "post_code"
    t.string "shipping_address"
    t.integer "postage"
    t.integer "payment_method"
    t.integer "total_money"
    t.string "name"

      t.timestamps
    end
  end
end
