class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :address
      t.decimal :total_cost
      t.string  :status

      t.timestamps
    end
  end
end
