class HousesController < ApplicationController
  def index
    @houses = House.all.page(params[:page]).per(10)
  end

  def new
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to @house
    else
      render 'new'
    end
  end

  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      redirect_to @house
    else
      render 'edit'
    end
  end

  def show
    @house = House.eager_load(:images, :reviews).find(params[:id])
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path
  end

  private
  def house_params
    params.require(:house).permit(:name, :size, :price, :information, :images, :imageDescriptions)
  end
end
