class ItemsController < ApplicationController
before_action :set_item, except: [:index, :new, :create]
before_action :authenticate_user!, except: [:index, :show]
before_action :move_to_index, only: [:edit, :update, :destroy]
before_action :edit_move_to_index, only: :edit
  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else 
      render :edit
    end      
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render show
    end
  end



  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def edit_move_to_index
    if Order.exists?(item_id: @item.id) && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
