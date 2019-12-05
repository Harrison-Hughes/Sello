class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    find_product
    @order = Order.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      ProductTag.create(product_id: @product.id, tag_id: params[:tag_ids])
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
