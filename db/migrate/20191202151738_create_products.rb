class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock_count
      t.integer :user_id
      t.string :img_url, default: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwiw9OmjopzmAhWrBGMBHX3xCGsQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.freeiconspng.com%2Fimg%2F23490&psig=AOvVaw081xXbG9NKsqiUjwL-726Z&ust=1575558324998221"

      t.timestamps
    end
  end
end
