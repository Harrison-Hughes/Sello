class OrdersController < ApplicationController

    def past_orders
        #byebug
        @user = current_user
        @orders = @user.past_orders
    end

    def order_details
        @user = current_user
        @order = Order.find(params[:order_id])
        @order_details = @order.order_details
    end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @buyer = User.find(@order.user_id)
  end

  def create
    byebug
    redirect_to new_session unless session[:user_id]
    
    
    product = Product.find(params[:order][:product_id])
    if product.stock_count <= 0
      flash[:notice] = "Sorry, this item is sold out!"
      redirect_to product_path(product)
    end

    product.stock_count -= 1
    product.save

    buyer = User.find(session[:user_id])

    if product.user_id == buyer.id
      flash[:notice] = "Sorry, you can't buy your own product!"
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
