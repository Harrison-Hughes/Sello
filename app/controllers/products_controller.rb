class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy, :basket, :checkout]

  def index
    @products = Product.all
    current_user ? @user = current_user : @user = nil
  end

  def new
    @product = Product.new
  end

  def basket
    @user = User.find(params[:id])
    @basket = @user.basket
  end

  def checkout
    @user = User.find(params[:id])
    @basket = @user.basket
  end

  def place_order
    @user = User.find(params[:id])
    if params[:address].length > 0
      @user.checkout_basket(params[:address])
      redirect_to orders_path
    else flash[:notice] = "Must enter an address!"
      render :checkout
    end
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