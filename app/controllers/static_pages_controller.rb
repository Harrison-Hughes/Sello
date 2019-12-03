class StaticPagesController < ApplicationController
  def index
    @products = Product.all 
  end
end
