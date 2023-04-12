class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:post_code, :region_id, :municipalities, :banchi, :building_name, :number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
