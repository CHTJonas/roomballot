class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.accessible_by(current_ability, :read)
  end

  def show
    @news_item = NewsItem.find(params[:id])
    authorize! :read, @news_item
  end

  def new
    authorize! :create, NewsItem
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
    authorize! :update, @news_item
  end

  def create
    authorize! :create, NewsItem
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to @news_item
    else
      render :new
    end
  end

  def update
    @news_item = NewsItem.find(params[:id])
    authorize! :update, @news_item
    if @news_item.update(news_item_params)
      redirect_to @news_item
    else
      render :edit
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    authorize! :destroy, @news_item
    @news_item.destroy
    redirect_to news_items_url
  end

  private

  def news_item_params
    params.require(:news_item).permit(:heading, :content)
    end
end
