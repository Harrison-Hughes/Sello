class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :address
      t.integer :product_id
      t.integer :purchase_price
      t.string  :status

      t.timestamps
    end
  end
end
