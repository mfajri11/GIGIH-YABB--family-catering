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
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html {redirect_to menu_path(@order.id), notice: 'Menu was successfuly created'}
      else
        format.json {render :new}
        format.json {render @order.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def join_all_menus
    menus.names.join(',')
  end

  def self.clean_unpaid_orders
    where.not(status: :PAID)
    .update_all(status: :CANCELLED)
  end

  def self.report_daily()
    where(order_date: DateTime.now.in_time_zone.beginning_of_day..DateTime.now.in_time_zone.end_of_day)
  end

  def self.get_price
    menus.map{|menu| menu.prices.sum}
  end

  # def self.get_report_by_email(:email)
  # end

  def self.get_report_by_price(price)
    where(total: price..)
  end

  def self_get_report_by_range(start, end_)
    where(order_date: start..end_)
  end
  
  private
  def get_order_params
    params.require(:order)
    .permit(:customer_id, menu_ids: [])
  end


end
