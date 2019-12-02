class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address
      t.integer :product_id
      t.integer :purchase_price

      t.timestamps
    end
  end
end
