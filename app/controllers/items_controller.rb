class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
<<<<<<< Updated upstream
  def index
    @items = Item.all#.order("created_at DESC")
  end

  def new
    @item = Item.new
=======
  before_action :set_item, only: [:show ]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new(item_params)
>>>>>>> Stashed changes
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

<<<<<<< Updated upstream
  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :status_id, :charges_id, :area_id, :days_id).merge(user_id: current_user.id)
=======
  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :status_id, :charges_id, :area_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
>>>>>>> Stashed changes
  end
end
