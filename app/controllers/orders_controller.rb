class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @item_order = ItemOrder.new
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @item_order = ItemOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:post_code, :region_id, :municipalities, :banchi, :building_name, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,        
    card: order_params[:token], 
    currency: 'jpy'             
  )
end