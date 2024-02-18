class CreateOrderItems < ActiveRecord::Migration[6.1]

  def change

    create_table :order_items do |t|

      t.integer :item_id, null: false

      t.integer :order_id, null: false

      t.integer :quantity, null: false

      t.integer :tax_included_price, null: false

      t.integer :price, null: false

      t.integer :number, null: false

      t.timestamps

    end

  end

end