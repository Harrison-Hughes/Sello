class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    @buyer = User.find(@order.user_id)
  end

  def create
    unless session[:user_id]
      redirect_to new_session
    end

    product = Product.find(params[:order][:product_id])
    if product.stock_count <= 0
      # TODO: Show an error: sold out!
      redirect_to product_path(product)
    end

    product.stock_count -= 1
    product.save

    buyer = User.find(session[:user_id])

    if product.user_id == buyer.id
      # TODO: Show an error: can't buy your own product!
      redirect_to product_path(product)
    end

    order = Order.create(
      user_id: buyer.id,
      address: "#{buyer.name}'s House'",
      status: "NEW",
      total_cost: product.price,
    )
    order_item = OrderProductJoin.create(
      order_id: order.id,
      product_id: product.id,
      product_name: product.name,
      purchase_price: product.price,
      product_description: product.description,
      quantity: 1,
    )

    redirect_to order_path(order)
  end
end
