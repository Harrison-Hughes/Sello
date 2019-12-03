class User < ApplicationRecord

    has_many :products
    has_many :orders
    has_many :products, through: :orders
    has_many :basket_joins

    @@basket = []

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

    def past_orders
        orders = Order.where(user_id: self.id)
    end

    def basket
        basket_joins = BasketJoin.where(user_id: self.id)
        basket = []
        basket_joins.each do |join|
            basket << {product_id: join.product_id, quantity: join.quantity}
        end
        basket
    end

    def add_to_basket(product_id, quantity=1)
        max_quantity = self.max_quantity(product_id)
        product = Product.find(product_id)
        if quantity <= max_quantity
            if self.basket.any? {|item| item[:product_id]==product_id}
                join = BasketJoin.find_by(user_id: self.id, product_id: product_id)
                new_quantity = join.quantity + quantity
                join.update(quantity: new_quantity)
            else 
                BasketJoin.create(user_id: self.id, product_id: product_id, quantity: quantity)
            end
        else puts "Error: your request for this item exceeds the stock. The maximum (additional) quantity you can request is #{max_quantity}"
        end
        self.basket
    end

    def checkout_basket(address)
        buyer_id = self.id
        order = Order.create_with_basket(self, address)
    end

    def max_quantity(product_id) #the max of this item that the user can add to their basket
        product_stock = Product.find(product_id).stock_count
        if self.basket.any? {|item| item[:product_id]==product_id}
            join = BasketJoin.find_by(user_id: self.id, product_id: product_id)
            current_number_in_basket = join.quantity
            max = product_stock - current_number_in_basket
        else max = product_stock
        end
        max
    end

    def basket_total
        basket = self.basket
        total = 0
        basket.each do |item|
            quantity = item[:quantity]
            product_price = Product.find(item[:product_id]).price
            total += quantity * product_price
        end
        total.to_s.to_f
    end

end
