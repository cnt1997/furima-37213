class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = DonationAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_params).permit(postal_code: postal_code, prefecture_id: prefecture_id, city: city,zblock: block,
      building: building, phone_number: phone_number, order_id: order.id, item_id: item_id).merge(user_id: current_user.id)
  end
  
end
