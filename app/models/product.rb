class Product < ApplicationRecord

    belongs_to :user
    has_many :product_tags
    has_many :tags, through: :product_tags
    has_many :orders
    has_many :users, through: :orders

end
