class ItemsController < ApplicationController
  def index
    @items = Item.includes(:order).order( "created_at DESC" )
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit( :image, :name, :comment, :price, :category_id, :status_id, :charges_id, :area_id, :days_id).merge(user_id: current_user.id)
  end
end
