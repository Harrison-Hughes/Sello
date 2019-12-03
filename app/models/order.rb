class Order < ApplicationRecord

    belongs_to :user
    has_many :order_product_joins
    has_many :products, through: :order_product_joins

    def self.create_with_basket(user, address)
        basket = user.basket
        total_cost = user.basket_total
        #create order
        order = Order.create(user_id: user.id, address: address, total_cost: total_cost)
        #remove item stock & create order-product-join entries
        basket.each do |hash|
            product_id = hash[:product_id]
            product = Product.find(product_id)
            quantity = hash[:quantity]
            product.stock_count = product.stock_count - quantity
            product.save
            join = OrderProductJoin.create(order_id: order.id, product_id: product_id, product_name: product.name, purchase_price: product.price, product_description: product.description, quantity: quantity)
        end
        #clear basket
        BasketJoin.where(user_id: user.id).destroy_all
        order
    end

    def product_details 
        
    end

end