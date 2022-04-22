class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    OrderCleanupWorkerJob.set(wait_until: Time.Zone.now.beginning_of_day + 17.hour).perform_later
    @orders = Order.all
  end
  
  def create
    order_params = get_order_params
    @order = Order.create(order_params)

    respond_to do |format|
      if @order.save
        format.html {redirect_to order_path(@order.id), notice: 'Menu was successfuly created'}
      else
        format.html {render :new}
        format.json {render @order.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    order_params = get_order_params
    @order = Order.find_by_id(params[:id])

    respond_to do |format|
      if @order.update(order_params)
        format.html {redirect_to @order, status: :see_other, notice: 'Order was successfuly udpated'}
        # format.json {render :update, status: :no_content}
      else
        format.html{render :edit, status: :unprocessable_entity}
        format.json {render @order.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
    render :show, status: :ok
  end

  private
  def get_order_params
    params.require(:order)
    .permit(:customer_id, :order_date, :total, menu_ids: [])
  end


end
