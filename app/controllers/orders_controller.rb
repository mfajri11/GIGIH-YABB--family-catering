class OrdersController < ApplicationController
  def create
    customer_id = params[:customer_id]
  end


  private
  def get_order_params
    params.require(:order).permit(cus)
  end
end
