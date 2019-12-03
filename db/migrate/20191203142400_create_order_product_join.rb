class CreateOrderProductJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :order_product_joins do |t|
      t.integer :order_id
      t.integer :product_id
      t.string  :product_name
      t.decimal :purchase_price
      t.string  :product_description
      t.integer :quantity
    end
  end
end
