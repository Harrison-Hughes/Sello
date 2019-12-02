class Order < ApplicationRecord

    belongs_to :user
    belongs_to :address
    belongs_to :product
    
end
