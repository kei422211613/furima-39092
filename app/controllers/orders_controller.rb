class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :region_id, :municipalities, :banchi, :building_name, :number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
