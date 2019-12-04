class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
    @products_in_threes = in_groups_of_edit(@products, 3)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_count, :img_url)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end

def in_groups_of_edit(array, number)
  rem = array.length % number
  leftovers = array.last(rem)
  output = array.first(array.length - rem).in_groups_of(number)
  output << leftovers if leftovers.length > 0
  output
end