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
  
    @user = current_user
    @basket = @user.basket
  end

  def checkout
    @user = current_user
    @basket = @user.basket
    if @basket.empty?
      flash[:notice] = "Basket is empty!"
      redirect_to basket_path 
    end
  end

  def place_order
    @user = current_user
    if params[:address].length > 0
      @user.checkout_basket(params[:address])
      redirect_to orders_path
    else flash[:notice] = "Must enter an address!"
      redirect_to checkout_path
    end
  end

  def show
    flash.now[:notice] = "Hello current action"
    if current_user
      @user = current_user
    end
    @product = Product.find(params[:id])
    if @user
      @no_in_basket = @user.number_in_basket(params[:id])
    end
  end

  def add_to_basket
    product_id = params[:product_id]
    user = current_user
    user.add_to_basket(product_id)
    flash.now[:notice] = "Hello current action"
    redirect_to product_path(product_id)
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
