class Order < ApplicationRecord
  belongs_to :customer
  has_many :menu_orders
  has_many :menus, through: :menu_orders
  # accepts_nested_attributes_for :menus, allow_destroy: true
  # accepts_nested_attributes_for :customer, update_only: true
  
  enum status: {
  NEW: 0,
  PAID: 1,
  CANCELLED: 2
}
  

  validates :total, numericality: {only_float:true}
  
  def calculate_total!
    write_attribute(:total, total_helper)
  end

  def join_all_menus
    menus.names.join(',')
  end

  def self.clean_unpaid_orders
    where.not(status: :PAID)
    .update_all(status: :CANCELLED)
  end

  def self.report_daily
    where(order_date: DateTime.now.in_time_zone.beginning_of_day..DateTime.now.in_time_zone.end_of_day)
  end

  def self.get_price
    all.map{|order| order.menus.prices.sum}
  end

  # def self.get_report_by_email(:email)
  # endS

  def self.get_report_by_price(price)
    where(total: price..)
  end

  def self_get_report_by_range(start, end_)
    where(order_date: start..end_)
  end
  
  
  private
  def total_helper
    menus
    .prices
    .sum
  end
end
