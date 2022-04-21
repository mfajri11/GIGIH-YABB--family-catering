class Order < ApplicationRecord
  belongs_to :customer
  has_many :menu_orders
  has_many :menus, through: :menu_orders

  enum status: {
  NEW: 0,
  PAID: 1,
  CANCELLED: 2
}
  

  validates :total, numericality: {only_float:true}
  
  def calculate_total!
    write_attribute(:total, total_helper)
  end
  
  private
  def total_helper
    ha = menus
    .prices
    .sum
    ha
  end
end
