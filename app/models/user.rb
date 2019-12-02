class User < ApplicationRecord

    has_many :products
    has_many :orders
    has_many :products, through: :orders

    def products
        Product.where user_id: self.id
    end

    def products_by_name
        self.products.map(&:name)
    end


end
