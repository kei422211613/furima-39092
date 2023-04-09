class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :situation_id, :delivery_fee_payment_id, :region_id, :deadline_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end