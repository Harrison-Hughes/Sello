class OrderProductJoin < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def purchase_price_formatted
    "%.2f" % self.purchase_price
  end
end
