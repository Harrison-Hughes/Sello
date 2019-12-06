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

  def remove_one_from_basket
    user = current_user
    product_id = params[:product_id]
    user.remove_from_basket(product_id)
    redirect_to basket_path
  end

  def remove_all_from_basket
    user = current_user
    product_id = params[:product_id]
    user.remove_all_from_basket(product_id)
    redirect_to basket_path
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
    did_add = user.add_to_basket(product_id)
    did_add ? flash[:notice] = nil : flash[:notice] = "Uh-oh - your basket currently contains the complete stock of this item! Come back again later to see if more stock becomes available."
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

  def my_products
      @products = Product.all.select {|product| product.user_id == params[:id].to_i }
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_count, :img_url)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
