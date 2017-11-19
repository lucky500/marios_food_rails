class ReviewsController < ApplicationController
  before_action :find_play #it will run this private method before any other methods.
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params) #require private method, permits params
    @review.product_id = @product.id #check if this product_id = id
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update    
    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to product_path(@product)
  end

  private

    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

    def find_play
      @product = Product.find(params[:product_id]) #find this product_id
    end

    def find_review
      @review = Review.find(params[:id])
    end
end