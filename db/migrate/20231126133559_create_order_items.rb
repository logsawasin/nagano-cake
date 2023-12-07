class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "tax_included_price"
    t.integer "price"
    t.integer "number"
      t.timestamps
    end
  end
end
