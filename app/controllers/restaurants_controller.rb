class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_attribut)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

  end

  def new
    @restaurant = Restaurant.new
  end
  # restaurant GET    /restaurants/:id(.:format) restaurants#show
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

private

  def restaurant_attribut
    {
      name: params[:restaurant][:name],
      address: params[:restaurant][:address],
      phone_number: params[:restaurant][:phone_number],
      category: params[:restaurant][:category]
    }
  end
end
