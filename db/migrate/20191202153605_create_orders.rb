class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :address_id
      t.integer :product_id
      t.integer :purchase_price

      t.timestamps
    end
  end
end
