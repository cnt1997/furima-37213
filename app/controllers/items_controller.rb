class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
