class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :udpate, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end