class ReviewsController < ApplicationController
  before_action :find_play #it will run this private method before any other methods.

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params) #require private method, permits params
    @review.product_id = @review.id #check if this product_id = id
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

    def find_play
      @product = Product.find(params[:product_id]) #find this product_id
    end
end