class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    t.integer :customer_id, null: false
    t.string :address_name, null: false
    t.string :post_code, null: false
    t.string :shipping_address, null: false
    t.integer :postage, null: false
    t.integer :payment_method, null: false, default: 0
    t.integer :total_money, null: false
    t.string :name, null: false

      t.timestamps
    end
  end
end
