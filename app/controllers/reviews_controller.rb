class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_attribute)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def index
    @reviews = Review.where(restaurant_id: params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

private
  def review_attribute
    {
      content: params[:review][:content],
      rating: params[:review][:rating].to_i
    }
  end
end

