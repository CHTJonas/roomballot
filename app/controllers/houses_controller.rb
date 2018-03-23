class HousesController < ApplicationController
  def new
  end
  def create
    @house = House.new(house_params)
    @house.save
    redirect_to @house
  end
  def show
    @house = House.find(params[:id])
  end


  private
  def house_params
    params.require(:house).permit(:name, :price, :information)
  end
end
