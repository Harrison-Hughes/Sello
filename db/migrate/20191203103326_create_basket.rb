class CreateBasket < ActiveRecord::Migration[5.0]
  def change
    create_table :basket_joins do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
    end
  end
end
