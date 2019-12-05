class OrdersController < ApplicationController

    def past_orders
        @user = User.find(params[:id])
        @orders = @user.past_orders
    end

    def order_details
        @user = User.find(params[:id])
        @order = Order.find(params[:order_id])
        @order_details = @order.order_details
    end

end