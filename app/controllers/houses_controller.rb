class HousesController < ApplicationController
  def index
    @houses = House.accessible_by(current_ability, :read)
      .page(params[:page]).per(10)
  end

  def new
    authorize! :create, House
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
    authorize! :update, @house
  end

  def create
    authorize! :create, House
    @house = House.new(house_params)
    if @house.save
      redirect_to @house
    else
      render 'new'
    end
  end

  def update
    @house = House.find(params[:id])
    authorize! :update, @house
    if @house.update(house_params)
      redirect_to @house
    else
      render 'edit'
    end
  end

  def show
    @house = House.eager_load(:images, :reviews).find(params[:id])
    gon.captions = @house.images.to_a.map(&:description)
    authorize! :read, @house
  end

  def destroy
    @house = House.find(params[:id])
    authorize! :destroy, @house
    @house.destroy
    redirect_to houses_path
  end

  private

  def house_params
    params.require(:house).permit(:name, :size, :price, :information, :images, :imageDescriptions)
  end
end
