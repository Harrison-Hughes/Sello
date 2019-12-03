class User < ApplicationRecord
    has_many :products
    has_many :orders
    has_many :products, through: :orders
    has_secure_password

    def products
        Product.where user_id: self.id
    end

    def products_by_name
        self.products.map(&:name)
    end

    def place_order(product_id:, address:) #TEMPORARY
        buyer_id = self.id
        product = Product.find(product_id)
        return Order.create(user_id: buyer_id, product_id: product_id, address: address, purchase_price: product.price, status: "complete")
        product.stock_count -= 1
        product.save
    end

    def return_order(order_id)
        order = Order.find(order_id)
        if order.user_id == self.id
            order.update(status: "returned")
            product = Product.find(order.product_id)
            product.stock_count += 1
            product.save
        else puts "This is not this user's order to return"
        end
    end

end
