class CreateCartitems < ActiveRecord::Migration[6.1]
  def change
    create_table :cartitems do |t|
    t.integer "item_id"
    t.integer "customer_id"
    t.integer "quantity"
      t.timestamps
    end
  end
end
