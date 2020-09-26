class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :status_id, :charges_id, :area_id, :dats_id, :price, :user_id)
  end
end
