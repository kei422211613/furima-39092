class PurchasesController < ApplicationController
  def index
    @order_form = OrderForm.new
  end
end
