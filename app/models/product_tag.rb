class ProductTag < ApplicationRecord

    belongs_to :tag 
    belongs_to :product

end
