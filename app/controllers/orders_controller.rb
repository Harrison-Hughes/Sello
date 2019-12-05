class OrdersController < ApplicationController

    def past_orders
        @user = current_user
        @orders = @user.past_orders
    end

    def order_details
        @user = current_user
        @order = Order.find(params[:order_id])
        @order_details = @order.order_details
    end

end
