class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def item_params
    params.require(:item).permit()
  end
end
