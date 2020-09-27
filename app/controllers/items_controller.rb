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
    params.require(:item).permit( :name, :image, :comment, :category_id, :status_id, :charges_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
