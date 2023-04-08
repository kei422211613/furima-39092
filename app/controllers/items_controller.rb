class ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new
    @user = User.find_by(id: params[:user_id])
  end
  
  def new
    @item = Item.new
  end

  def create
    Iten.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth).merge(user_id: current_user.id)
  end

end