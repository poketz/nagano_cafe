class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @genres = Genre.all
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction,
                                 :genre_id, :price, :is_active)
  end
end
