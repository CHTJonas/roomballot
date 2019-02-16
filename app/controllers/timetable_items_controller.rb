class TimetableItemsController < ApplicationController
  def index
    @timetable_items = TimetableItem.accessible_by(current_ability, :read)
  end

  def show
    @timetable_item = TimetableItem.find(params[:id])
    authorize! :read, @timetable_item
  end

  def new
    authorize! :create, TimetableItem
    @timetable_item = TimetableItem.new
  end

  def edit
    @timetable_item = TimetableItem.find(params[:id])
    authorize! :update, @timetable_item
  end

  def create
    authorize! :create, TimetableItem
    @timetable_item = TimetableItem.new(timetable_item_params)
    if @timetable_item.save
      redirect_to @timetable_item
    else
      render :new
    end
  end

  def update
    @timetable_item = TimetableItem.find(params[:id])
    authorize! :update, @timetable_item
    if @timetable_item.update(timetable_item_params)
      redirect_to @timetable_item
    else
      render :edit
    end
  end

  def destroy
    @timetable_item = TimetableItem.find(params[:id])
    authorize! :destroy, @timetable_item
    @timetable_item.destroy
    redirect_to timetable_items_url
  end

  private

  def timetable_item_params
    params.require(:timetable_item).permit(:when, :description)
  end
end
