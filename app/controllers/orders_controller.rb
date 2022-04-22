class OrdersController < ApplicationController
  def create
    order_params = get_order_params
    @order = Order.create(order_params)

    respond_to do |format|
      if @order.save
        format.html {redirect_to menu_path(@order.id), notice: 'Menu was successfuly created'}
      end
    end
    
  end


  private
  def get_order_params
    params.require(:order).permit(cus)
  end
end
