class User < ApplicationRecord

    has_many :products
    has_many :orders
    has_many :products, through: :orders

end
