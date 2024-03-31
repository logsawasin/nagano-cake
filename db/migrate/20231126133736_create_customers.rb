class CreateCustomers < ActiveRecord::Migration[6.1]
    def change
        create_table :customers do |t|
            
              ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      
        t.boolean :is_status, default: true
        t.string :last_name
        t.string :first_name
        t.string :last_name_kana
        t.string :first_name_kana
        t.string :post_code
        t.string :address
        t.string :telephone_number
        t.timestamps
        end
    end
end