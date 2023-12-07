class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
    t.string "name"
    t.text "text"
    t.integer "without_tax_price"
      t.timestamps
    end
  end
end
